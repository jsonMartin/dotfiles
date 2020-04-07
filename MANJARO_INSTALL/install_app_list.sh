#!/bin/sh
yay -S base-devel
yay -S $(cat app_list.txt | xargs)

