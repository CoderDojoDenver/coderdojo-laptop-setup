#!/usr/bin/python

import os
import sys
import subprocess


username = ''
while not username:
    username = raw_input('What is the name of the student/ninja to set up? ')

print('Welcome to CoderDojo Denver, {}, we are very happy to have you with us!'.format(username))

home_dir = os.getenv('HOME')
if not home_dir:
    home_dir = raw_input('What is the full disk path of your $HOME directory? enter it like this: /home/username   : ')

try:
    os.mkdir('{}/Desktop/{}'.format(home_dir, username))
except OSError:
    print('A folder for {} may already exist on the Desktop. Run this setup script again, but use a different name for the student/ninja.'.format(username))
    sys.exit()

base_folder = '{}/Desktop/{}'.format(home_dir, username)

try:
    os.chdir(base_folder)
except OSError:
    print('The setup script could not navigate to {}, can you check that it exists?'.format(base_folder))

print('Excellent, we should be all set. Let\'s grab all of the code from GitHub!')
print('=' * 100)

repos = ['MyFirstWebsite', 'Intermediate-HTML-CSS', 'Beginner-JavaScript', 'Intermediate-JavaScript', 'Beginner-Databases']
for repo in repos:
    subprocess.check_call(['/usr/bin/git', 'clone', 'https://github.com/CoderDojoDenver/{}'.format(repo)])

print('=' * 100)

print('We should be all finished now; good luck, {}! Be cool, and remember our rule of "ask 3 then me"'.format(username))
