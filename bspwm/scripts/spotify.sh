#!/bin/sh

wid=$1
class=$2
instance=$3
consequences=$4

main() {
	case "$class" in
		Spotify)
			echo "desktop=6" state=floating rectangle=1600x850+0+0 center=true follow=on focus=on
			;;
		"")
                        sleep 0.5

			wm_class=($(xprop -id $wid | grep "WM_CLASS" | grep -Po '"\K[^,"]+'))

			class=${wm_class[-1]}

			[[ ${#wm_class[@]} == "2" ]] && instance=${wm_class[0]}

			[[ -n "$class" ]] && main
			;;
	esac
}

main