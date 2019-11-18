#! /usr/bin/python3

import subprocess

print('Hello world')

for i in range(1000, 9999):
    process = subprocess.Popen(['./flag'], stdin = subprocess.PIPE, stdout=subprocess.PIPE)
    process.stdin.write(str(i).encode())
    result = process.communicate()[0].decode('utf-8')
    if 'success' in str(result).lower():
        print(result)
        print('Found the flag!')
        print('Correct digit combo ', i)
        exit()

    process.stdin.close()

print('Execution finished!')
