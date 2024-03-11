#!/usr/bin/env bash

BLANK='#00000000'
CLEAR='#ffffff22'
DEFAULT='#bac2decc'
TEXT='#bac2deee'
KEY='#89b4fabb'
WRONG='#880000bb'
VERIFYING='#bac2debb'

i3lock \
--insidever-color=$CLEAR     \
--ringver-color=$VERIFYING   \
\
--insidewrong-color=$CLEAR   \
--ringwrong-color=$WRONG     \
\
--inside-color=$BLANK        \
--ring-color=$DEFAULT        \
--line-color=$BLANK          \
--separator-color=$DEFAULT   \
\
--verif-color=$TEXT          \
--wrong-color=$TEXT          \
--time-color=$TEXT           \
--date-color=$TEXT           \
--keyhl-color=$KEY         \
--bshl-color=$KEY          \
\
--screen 1                   \
--blur 5                     \
--clock                      \
--indicator                  \
--time-str="%I:%M %p"        \
--date-str="%a, %x"       \