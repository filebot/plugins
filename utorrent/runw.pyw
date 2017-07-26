import sys
import subprocess

# execute command (and hide cmd window)
subprocess.run(sys.argv[1:], creationflags=0x08000000)
