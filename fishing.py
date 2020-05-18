import os, sys, subprocess, time, pathlib

with subprocess.Popen(['AutoIt3_x64.exe', 'C:/Users/jtgam/Desktop/programming/misc/ff_bot/fishing.au3'], shell=True, stdout=subprocess.PIPE) as test_proc:
    print(str(test_proc.stdout.read()))