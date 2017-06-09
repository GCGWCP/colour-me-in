#!/bin/bash

function show_all_colors() {
	for fgbg in 38 48; do
		for color in {0..256}; do
			echo -en "\e[${fgbg};5;${color}m ${color}\t\e[0m"
			if [ $((($color + 1) % 10)) == 0 ]; then
				echo
			fi
		done
	done
}


function select_fg_color() {
	echo -e "Select a color: "; read color
	return "\e[38;$color;m"
}


function select_bg_color() {
	echo -e "Select a color: "; read color
	return "\e[48;$color;m"
}


function main() {
	show_all_colors
	if [[ $1 == '--fg' ]]; then
		fgc=select_fg_color
		echo "$fgc" 
	elif [[ $1 == '--bg' ]]; then
		bgc=select_bg_color
		echo "$bgc"
	elif [[ $1 == '--fgbg' ]]; then
		fgc=select_fg_color
		bgc=select_fg_color
		echo "$fgc"
		echo "$bgc"
	else
		show_all_colors
	fi
}

main
