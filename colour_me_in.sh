#!/bin/bash

## I must be real, because somehow I feel,
## That I'm just the idea.

# Set
bold=1 	
dim=2 	
underlined=4 	
blink=5 	
inverted=7 	
hidden=8 	

# Reset
reset_all=0
reset_bold=21
reset_dim=22
reset_underlined=24
reset_blink=25
reset_reverse=27
reset_hidden=28

# 8/16 Colors
# Foreground Colors
default_fg=39
black=30
red=31
green=32
yellow=33
blue=34
magenta=35
cyan=36
l_gray=37
d_gray=90
l_red=91
l_green=92
l_yellow=93
l_blue=94
l_magenta=95
l_cyan=96
white=97

# Background Colors
default_bg=49
black=40
red=41
green=42
yellow=43
blue=44
magenta=45
cyan=46
l_gray=47
d_gray=100
l_red=101
l_green=102
l_yellow=103
l_blue=104
l_magenta=105
l_cyan=106
white=107

text_start="\e["
text_set_attr=""
text_reset_attr=""
text_fg_color=""
text_bg_color=""
text_content="<Your Text Here>"
text_end="\e[0m"


function wrap_text() {
	text_content
	OIFS=$IFS
	IFS=";"
	text=( \
		"$text_start" \
		"$text_set_attr" \
		"$text_fg_color" \
		"$text_bg_color" \
		"$text_content" \
		"$text_end" \
	)
	deco_text="${text[@]}"
	IFS=$OIFS
	return deco_text
}


function main() {
	if [[ ! $1 ]]; then
		wrapper=wrap_text
		echo -e $wrapper
		exit 0
	else
		text_content=$1
		wrapper=wrap_text
		echo -e $wrapper
		exit 0
	fi
}

main
