import os, sys, subprocess, time
# C:/Users/jtgam/Desktop/programming/misc/ff_bot/lancer.au3 msi path
# lancer.au3 home path
with subprocess.Popen(['AutoIt3_x64.exe','C:/Users/jtgam/Desktop/programming/misc/ff_bot/lancer.au3'], shell=True, stdout=subprocess.PIPE) as test_proc:
    print(test_proc.stdout.read())