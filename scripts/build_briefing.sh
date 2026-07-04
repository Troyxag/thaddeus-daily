#!/usr/bin/env bash
# Builds the Slack briefing payload for a given day and prints it as JSON to stdout.
# Does NOT post anything — posting is the workflow's job. Run from the repo root.
#
# Usage: bash scripts/build_briefing.sh <day-number>

set -euo pipefail

DAY="${1:?usage: build_briefing.sh <day-number>}"

if [ "$DAY" -ge 22 ]; then
  LINKS='<https://www.codecademy.com/learn/ext-paths/saa-c03-aws-certified-solutions-architect-associate|SAA-C03 Cert Prep (Codecademy)> · <https://explore.skillbuilder.aws/|AWS Skill Builder> · <https://tutorialsdojo.com/aws-certified-solutions-architect-associate-saa-c03/|Tutorials Dojo cheat sheets>'
  TEXT=$(printf '*Day %s — AWS (SAA-C03 cert prep)*\nCert-prep pacing: work the SAA-C03 path today; drill check-ins 2-3x/week in practice-question format.\n%s' "$DAY" "$LINKS")
else
  ROW=$(jq -c --argjson d "$DAY" '.[] | select(.day == $d)' curriculum.json)
  if [ -z "$ROW" ]; then
    echo "No curriculum entry for day $DAY" >&2
    exit 1
  fi
  MODULE=$(echo "$ROW" | jq -r '.module')
  OBJ=$(echo "$ROW" | jq -r '.objective')
  LINKS=$(echo "$ROW" | jq -r '[.resources[] | "<\(.url)|\(.label)>"] | join(" · ")')
  TEXT=$(printf '*Day %s — %s*\n%s\n%s' "$DAY" "$MODULE" "$OBJ" "$LINKS")
fi

jq -n --arg text "$TEXT" '{text: $text}'
