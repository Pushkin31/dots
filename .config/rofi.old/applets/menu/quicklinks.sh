#!/usr/bin/env bash

## Author: Aditya Shakya
## Mail  : adi1090x@gmail.com
## Github: @adi1090x
## gmail : @adi1090x

polybar-msg hook quicklinks 1

style="$($HOME/.config/rofi/applets/menu/style.sh)"

dir="$HOME/.config/rofi/applets/menu/configs/$style"
rofi_command="rofi -theme $dir/quicklinks.rasi"


# Error msg
msg() {
	rofi -theme "$HOME/.config/rofi/applets/styles/message.rasi" -e "$1"
}

# Browser
if 	 [[ -f /usr/bin/firefox ]]; then
	app="firefox"
elif [[ -f /usr/bin/chromium ]]; then
	app="chromium"
elif [[ -f /usr/bin/midori ]]; then
	app="midori"
else
	msg "No suitable web browser found!"
	exit 1
fi

# Links
instagram=""
mail=""
gmail=""
youtube=""
github=""

# Variable passed to rofi
options="$instagram\n$mail\n$gmail\n$youtube\n$github"

chosen="$(echo -e "$options" | $rofi_command -p "Open In  :  $app" -dmenu -selected-row 0)"
case $chosen in
    $instagram)
        $app https://www.instagram.com/direct/inbox/ &
        ;;
    $mail)
        $app https://e.mail.ru/inbox/ &
        ;;
    $gmail)
        $app https://mail.google.com/mail/u/0/#inbox &
        ;;
    $youtube)
        $app https://www.youtube.com &
        ;;
	$github)
        $app https://github.com/Pushkin31?tab=repositories&
        ;;
esac
polybar-msg hook quicklinks 2
