# Thaddeus Daily Briefing Bot

A Slack bot named **Thaddeus** that posts your DevOps curriculum day — day number, module, single objective, Codecademy link — every day at 1 PM via a scheduled GitHub Actions workflow.

This is also your first CI/CD artifact: a real scheduled pipeline you own, before you even hit Days 13–17 (the CI/CD module). Mention it in interviews.

## How it works

```
GitHub Actions (cron, 17:00 UTC)
  → reads state/day.txt        (which day you're on)
  → looks up curriculum.json   (module, objective, link)
  → POSTs to Slack webhook     (arrives as "Thaddeus", pings like a real DM)
```

Day 22+ automatically switches to AWS cert-prep mode (per curriculum §5.5).

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

- **Advancing the day:** after you complete a session, bump the number in `state/day.txt` (github.com → open file → pencil icon → commit). The bot never auto-advances — miss a day, and tomorrow repeats it. That matches the curriculum rule: resume, never cram.
- **Skipping/reordering:** set `day.txt` to any number.
- **Your permanent log** stays in `session-log.md` in the project folder (confidence scores, distractions, parked items). `day.txt` only drives the bot.

## Notes

- Free on both platforms (Slack free tier allows 10 integrations; Actions minutes are free well beyond this usage).
- Cron is UTC: `0 17 * * *` = 1 PM EDT. After the November clock change it's 12 PM EST — edit to `0 18 * * *` if that bothers you.
- GitHub may pause scheduled workflows in repos with no activity for 60 days — your day.txt commits count as activity, so this only matters if you stop entirely.
