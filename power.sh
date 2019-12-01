#!/bin/sh

poweroff=" Power Off"
reboot=" Reboot"
suspend=" Suspend"
logout=" Logout"

options="$poweroff\n$reboot\n$suspend\n$logout"

# Handle argument.
if [[ -z "$@" ]]
then
  echo -e "$options"
else
  case $@ in
    $poweroff )
      systemctl poweroff
      exit;;
    $reboot )
      systemctl reboot
      exit;;
    $suspend )
      systemctl suspend
      exit;;
    $logout )
      session=`loginctl session-status | head -n 1 | awk '{print $1}'`
      loginctl terminate-session $session
      exit;;
esac
fi
