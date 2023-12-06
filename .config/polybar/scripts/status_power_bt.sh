#!/bin/sh

set -e

daemon=${1:a2dp_sink}
state="%{F#AEB4C6}off%{F-}"
cmd="$(systemctl status $daemon | grep -i ": active" 2>/dev/null || echo '')"

[[ "$cmd" ]] && state="%{F#B48EAD}on%{F-}"

echo "%{F#AEB4C6}${daemon}%{F-} ${state}"
exit 0

