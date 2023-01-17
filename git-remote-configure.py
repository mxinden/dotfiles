#!/usr/bin/env python3

import subprocess
import sys
import os

username = sys.argv[1]
project_name = os.path.basename(os.getcwd())

https = (f'https://github.com/{username}/{project_name}.git')
ssh = (f'git@github.com:{username}/{project_name}.git')

print(https, ssh)

subprocess.run(["git", "remote", "add", username, https])
subprocess.run(["git", "remote", "set-url", "--push", username, ssh])
