import os, sys, subprocess, time

with subprocess.Popen(['AutoIt3_x64.exe','arcanist.au3'], shell=True, stdout=subprocess.PIPE) as test_proc:
    print(test_proc.stdout.read())