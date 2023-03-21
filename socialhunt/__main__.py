#! /usr/bin/env python3

"""
Socialhunt: Find Usernames Across Social Networks Module

This module contains the main logic to search for usernames at social
networks.
"""

import sys


if __name__ == "__main__":
    # Check if the user is using the correct version of Python
    python_version = sys.version.split()[0]

    if sys.version_info < (3, 6):
        print("Socialhunt requires Python 3.6+\nYou are using Python %s, which is not supported by Socialhunt" % (python_version))
        sys.exit(1)

    import sherlock
    sherlock.main()
