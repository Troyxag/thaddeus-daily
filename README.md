# Thaddeus Daily Briefing Bot (v2)

A Slack bot named **Thaddeus** running a **60-day, 3-hours-per-day (1–4 PM, weekdays)** DevOps curriculum: Docker → Linux/Git → Kubernetes → Helm/Observability → CKA prep → CI/CD (Actions, Jenkins, Bitbucket) → Terraform → AWS SAA-C03 → capstone. Each day has a plan (Learn/Lab/Drill), curated links, and a **checkpoint answer that gates the next day**.

This repo is itself a CI/CD portfolio artifact: scheduled pipeline, PR validation, and an input-driven grading workflow.

## How it works

```
WEEKDAYS 1 PM — Thaddeus Daily Briefing (cron '0 17 * * 1-5')
  → reads state/day.txt          (which day you're on)
  → looks up curriculum.json     (objective, plan, links, checkpoint)
  → POSTs briefing to Slack      (links one per line + today's checkpoint)

WHEN YOU FINISH — Submit Answer (Actions → Run workflow, type your answer)
  → pattern-checks it against the day's checkpoint (robot rule, no AI)
  → PASS: commits day.txt +1, Slack "✅ Day N cleared, Day N+1 unlocked"
  → FAIL: Slack "❌ not yet" + hint, day stays locked, run shows red
```

## One-time setup (~30 min)

### 1. Create the Slack app (~10 min)
1. Go to https://api.slack.com/apps → **Create New App** → **From scratch**
2. Name: `Thaddeus` · Workspace: your workspace
3. (Optional) **Basic Information → Display Information** → upload an icon
4. **Incoming Webhooks** (left sidebar) → toggle **On** → **Add New Webhook to Workspace**
5. Pick where briefings land — a channel like `#devops-daily`, or yourself (arrives in the Thaddeus app conversation). Either way it **notifies**, unlike self-DMs.
6. Copy the webhook URL (`https://hooks.slack.com/services/...`). **Treat it like a password — never commit it.**

### 2. Create the GitHub repo (~10 min)
1. github.com → New repository → name `thaddeus-daily` (public = visible portfolio piece; the webhook stays secret either way)
2. Push this folder's contents:
   ```bash
   cd "thaddeus-bot"
   git init && git add . && git commit -m "Thaddeus daily briefing bot"
   git branch -M main
   git remote add origin https://github.com/<YOUR_USERNAME>/thaddeus-daily.git
   git push -u origin main
   ```
   (Or drag-and-drop the files on github.com — but note the `.github/workflows/` path must be preserved.)

### 3. Add the secret + test (~5 min)
1. Repo → **Settings → Secrets and variables → Actions → New repository secret**
   - Name: `SLACK_WEBHOOK_URL` · Value: the webhook URL
2. **Actions** tab → enable workflows if prompted → select **Thaddeus Daily Briefing** → **Run workflow** (manual test)
3. Check Slack. If Thaddeus spoke, you're done.

## Daily operation

- **Advancing the day:** finish the work, then Actions → **Submit Answer** → Run workflow → type your checkpoint answer. Pass = auto-advance + Slack confirmation. The bot never advances on a calendar — miss a day, tomorrow repeats it. Resume, never cram.
- **Manual override:** editing `state/day.txt` directly still works (skip, reorder, correct a mistake) — that's operational data, committed straight to `main`.
- **Your permanent log** stays in `session-log.md` in the project folder (confidence scores, distractions, parked items). `day.txt` only drives the bot.
- **Deep grading:** the robot rule proves you did the work; whether your *explanation* is interview-ready gets tested in the 1–4 PM session with Claude/Thaddeus.

## Branching & testing

This repo runs **GitHub Flow** — `main` is production, because the 1 PM cron ships whatever `main` contains.

1. Branch off `main` for any change: `feat/...` (new capability), `fix/...` (bug), `chore/...` (housekeeping)
2. Push the branch and open a PR
3. The **Validate** workflow runs automatically on every PR: curriculum schema check, `day.txt` sanity, YAML parse of all workflows, and a dry-run build of *every* day's briefing (nothing is posted to Slack)
4. Green check → **Squash and merge** → delete the branch
5. Exception: `state/day.txt` bumps are operational data, not code — commit those straight to `main`

The briefing-building logic lives in `scripts/build_briefing.sh`, shared by both workflows: the daily job pipes its output to Slack; Validate just checks it builds. Logic in scripts, YAML kept thin — that's the pattern to carry into every pipeline you write.

**Optional hardening:** Settings → Branches → add a ruleset/protection rule on `main` requiring PRs and a passing Validate check. Leave admin bypass on so your own quick day.txt web-edits stay one-click.

## Notes

- Free on both platforms (Slack free tier allows 10 integrations; Actions minutes are free well beyond this usage).
- Cron is UTC: `0 17 * * *` = 1 PM EDT. After the November clock change it's 12 PM EST — edit to `0 18 * * *` if that bothers you.
- GitHub may pause scheduled workflows in repos with no activity for 60 days — your day.txt commits count as activity, so this only matters if you stop entirely.
