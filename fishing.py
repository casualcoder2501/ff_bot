import os, sys, subprocess, time, pathlib
# C:/Users/jtgam/Desktop/programming/misc/ff_bot/fishing.au3
# fishing.au3
with subprocess.Popen(['AutoIt3_x64.exe', 'C:/Users/jtgam/Desktop/programming/misc/ff_bot/cooking.au3'], shell=True, stdout=subprocess.PIPE) as test_proc:
    print(str(test_proc.stdout.read()))