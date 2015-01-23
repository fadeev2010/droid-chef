#!/bin/sh

# delete WM
vagrant destroy &&

#create new wm
vagrant up &&

# delete key old wm
ssh-keygen -f "/home/sergey/.ssh/known_hosts" -R [127.0.0.1]:2222 &&

# copy new key
ssh-copy-id vagrant@127.0.0.1 -p2222 &&

# prepare new wm
knife solo prepare vagrant@127.0.0.1 -p 2222