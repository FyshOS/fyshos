#!/bin/zsh

setopt prompt_subst

function json_value {
  cat $1 |
    sed -e 's/[{}]/''/g' |
    awk -v k="text" '{n=split($0,a,","); for (i=1; i<=n; i++) print a[i]}' |
    grep "\"$2\"" | awk '{split($0,a,":"); print a[2]}' | sed -e 's/^"//' -e 's/"$//'
}

function preexec() {
    timer=${timer:-$SECONDS}
}

function precmd() {
  if [ $timer ]; then
    elapsed=$(($SECONDS - $timer))

    export TIMED="${elapsed}s%{$reset_color%}"
  else
    export TIMED=""
  fi
  unset timer
}


function clock {
  PREF=`json_value ~/.config/fyne/com.fyshos.fynedesk/preferences.json clockformatting`

  if [[ "x$PREF" == "x24h" ]]; then
    FMT="%-H:%M:%S"
  else
    FMT="%-I:%M%p"
  fi

  echo "[$(date +"${FMT}")]"
}

function status {
  RET=$(echo $?)
  if [ $RET -eq 0 ]; then
    echo '%F{010}'
  else
    echo '%F{009}'
  fi
}

user=$'%F{027}%n@%m'
workingDir=$'%F{007}%d'
newLine=$'\n'
PROMPT=${user}\ ${workingDir}\ ${newLine}"%F{166}><> %1 %f"

dateTime=$'$(status)$TIMED%F{007} $(clock)'
upLine=$'\e[1A'
downLine=$'\e[1B'
RPROMPT=%{${upLine}%}${dateTime}%{${downLine}%}

