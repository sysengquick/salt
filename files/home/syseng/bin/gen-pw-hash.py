#! /usr/bin/python3

# https://unix.stackexchange.com/questions/52108/how-to-create-sha512-password-hashes-on-command-line
# answer by slm  (https://unix.stackexchange.com/users/7453/slm)
# and       levi (https://unix.stackexchange.com/users/259638/levi)

import crypt,getpass

pw = getpass.getpass()
pw2 = getpass.getpass("Confirm: ")

if pw == pw2:
    print(crypt.crypt(pw, crypt.mksalt(crypt.METHOD_SHA512)))
else:
    print("error: passwords do not match")
