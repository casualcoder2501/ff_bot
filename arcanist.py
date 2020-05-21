import os, sys, subprocess, time
# C:/Users/jtgam/Desktop/programming/misc/ff_bot/arcanist.au3 msi path
# arcanist.au3 home path
with subprocess.Popen(['AutoIt3_x64.exe','arcanist.au3'], shell=True, stdout=subprocess.PIPE) as test_proc:
    print(test_proc.stdout.read())