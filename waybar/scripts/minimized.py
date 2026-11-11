#!/usr/bin/env python3
"""Waybar module: count of windows minimized to special:magic.

Listens on Hyprland's event socket and prints one JSON line per change,
so the bar updates instantly without polling. Empty text hides the module.
"""
import json
import os
import socket
import subprocess
import sys
import time

WORKSPACE = "special:magic"
ICON = ""  # nf-fa-window_restore


def emit():
    try:
        out = subprocess.run(["hyprctl", "-j", "clients"], capture_output=True, text=True, timeout=2).stdout
        clients = [c for c in json.loads(out) if c["workspace"]["name"] == WORKSPACE]
    except Exception:
        clients = []
    if clients:
        tooltip = "\n".join(f"{c['class']}: {c['title']}" for c in clients)
        data = {"text": f"{ICON} {len(clients)}", "tooltip": tooltip, "class": "has-windows"}
    else:
        data = {"text": "", "tooltip": "", "class": "empty"}
    print(json.dumps(data), flush=True)


def main():
    path = os.path.join(os.environ["XDG_RUNTIME_DIR"], "hypr", os.environ["HYPRLAND_INSTANCE_SIGNATURE"], ".socket2.sock")
    watch = ("openwindow>>", "closewindow>>", "movewindow>>", "movewindowv2>>")
    while True:
        emit()
        try:
            with socket.socket(socket.AF_UNIX, socket.SOCK_STREAM) as s:
                s.connect(path)
                buf = b""
                while chunk := s.recv(4096):
                    buf += chunk
                    *lines, buf = buf.split(b"\n")
                    if any(l.decode(errors="ignore").startswith(watch) for l in lines):
                        emit()
        except OSError:
            pass
        time.sleep(1)  # socket closed (e.g. Hyprland restart); retry


if __name__ == "__main__":
    try:
        main()
    except (KeyboardInterrupt, BrokenPipeError):
        sys.exit(0)
