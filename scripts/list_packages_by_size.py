#!/usr/bin/env python                                                                             
# Prints out packages installed on system                                                         
# ordered in descending order on size.                                                            

# Abhishek Dasgupta                                                                               

import subprocess as S
import pickle, os

storage = '/home/username/.config/instsize'
def appendpkg(s): pkgsizes[s] = size(s)


def sgn(x):
    if x == 0:
        return 0
    else:
        return int(x/abs(x))


execo = lambda s: S.Popen(s.split(' '), stdout=S.PIPE).communicate()[0]


size = lambda s: float(filter(lambda s: s[:9] == 'Installed', 
                              execo('pacman -Qi '+s).split("\n"))
                       [0][17:-2])

packages = execo('pacman -Qq').split("\n")[:-1]


def printpkg(p):
    print("%-30s %.2f" % (p, pkgsizes[p]))


if os.path.exists(storage):
    p1 = open(storage, 'rb')
    pkgsizes = pickle.load(p1)
    p1.close()
else:
    pkgsizes = {}
    map(appendpkg, packages)
    p1 = open(storage, 'wb')
    pickle.dump(pkgsizes, p1)

packages.sort(cmp=lambda x, y: sgn(pkgsizes[x] - pkgsizes[y]), reverse=True)
map(printpkg, packages)
