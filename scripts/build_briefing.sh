#!/usr/bin/env bash
# Builds the Slack briefing payload for a given day and prints it as JSON to stdout.
# Does NOT post anything — posting is the workflow's job. Run from the repo root.
#
# Usage: bash scripts/build_briefing.sh <day-number>

set -euo pipefail

DAY="${1:?usage: build_briefing.sh <day-number>}"

if [ "$DAY" -gt 60 ]; then
  TEXT=$(printf '*Program complete — 60/60 days.* 🎓\nThe curriculum is finished. Next arcs: CKA exam, DOP-C02 prep, and shipping the portfolio.\nSay the word in Claude to design the next phase.')
  jq -n --arg text "$TEXT" '{text: $text}'
  exit 0
fi

ROW=$(jq -c --argjson d "$DAY" '.[] | select(.day == $d)' curriculum.json)
if [ -z "$ROW" ]; then
  echo "No curriculum entry for day $DAY" >&2
  exit 1
fi

WEEK=$(echo "$ROW"   | jq -r '.week')
MODULE=$(echo "$ROW" | jq -r '.module')
OBJ=$(echo "$ROW"    | jq -r '.objective')
PLAN=$(echo "$ROW"   | jq -r '[.plan[] | "• \(.)"] | join("\n")')
LINKS=$(echo "$ROW"  | jq -r '[.resources[] | "<\(.url)|\(.label)>"] | join("\n")')
CP=$(echo "$ROW"     | jq -r '.checkpoint.prompt')
NEXT=$((DAY + 1))

TEXT=$(printf '*Day %s/60 — %s* (Week %s)\n%s\n\n*Plan (1–4 PM):*\n%s\n\n*Links:*\n%s\n\n*Checkpoint to unlock Day %s:*\n%s\n_Submit: github.com/Troyxag/thaddeus-daily → Actions → Submit Answer → Run workflow_' \
  "$DAY" "$MODULE" "$WEEK" "$OBJ" "$PLAN" "$LINKS" "$NEXT" "$CP")

jq -n --arg text "$TEXT" '{text: $text}'
