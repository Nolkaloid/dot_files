#!/bin/sh

screen=" Screen"
selection=" Selection"
window=" Window"

options="$screen\n$selection\n$window"

# Handle argument.
if [[ -z "$@" ]]
then
  echo -e "$options"
else
  case $@ in
    $screen )
      nohup spectacle -b -f &>/dev/null &
      exit;;
    $selection )
      nohup spectacle -b -c -r &>/dev/null &
      exit;;
    $window )
      nohup spectacle -b -c  -a &>/dev/null &
      exit;;
esac
fi
