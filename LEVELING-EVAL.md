# Curriculum vs. Industry Leveling — Evaluation (2026-07-04)

Purpose: gauge what the 60-day curriculum actually buys against how the industry levels DevOps engineers, and where SRE fits. The curriculum itself stays intact — gaps are routed to a defined post-program ring, not squeezed into the 60 days.

## 1. How the industry levels the role (2026 snapshot)

**Junior (0–2 yrs, ~$100–140k):** executes defined tasks with guidance — builds pipelines from templates, follows runbooks, fixes known issues. Expected fluency: Linux, Git, Docker, CI/CD fundamentals, one cloud, basic scripting (Bash), basic monitoring.

**Mid (3–5 yrs, ~$128–200k):** owns systems end-to-end without supervision. Expected: Kubernetes for real (Helm charts, StatefulSets), Terraform modules, Prometheus/Grafana, VPC-level cloud networking, end-to-end automation in **Python or Go**, DevSecOps practices (scanning in pipelines, secrets management).

**Senior (5–8+ yrs, ~$158–260k):** architecture and leverage — designs deployment architectures and DR plans, owns security/compliance posture, FinOps awareness, platform engineering (internal developer platforms), mentoring and documentation others rely on. This level is scope and judgment, not coursework.

Core stack named at every level: **Docker, Kubernetes, Terraform, Python, Bash.**

## 2. Coverage matrix — curriculum vs. junior→mid expectations

| Requirement | Where in the curriculum | Status |
|---|---|---|
| Linux + shell | Days 6, 10; every lab thereafter | ✅ working level |
| Git + PR workflow | Day 7 + this repo's real branch/PR/CI flow | ✅ (already practicing it) |
| Docker incl. multi-stage, registries, scanning | Days 1–5, 8 | ✅ strong |
| Kubernetes core (Deployments, Services, config) | Days 11–15 | ✅ strong |
| Kubernetes depth (RBAC, NetPol, HPA, StatefulSets) | Days 16–20 | ✅ — this is mid-level material |
| Helm (consume + author) | Days 21–22, 25 | ✅ — mid-level material |
| Monitoring: Prometheus/Grafana/alerting | Days 23–25 + 9 yrs consuming it | ✅✅ differentiator |
| CI/CD authoring (Actions + Jenkins + Bitbucket) | Days 31–40 + capstone | ✅ strong, multi-dialect |
| Terraform incl. state, modules, CI | Days 41–45 | ✅ — modules = mid-level material |
| AWS + credential | Days 46–55 (SAA-C03 booked at D55) + real RDS/MSK/EKS history | ✅ |
| Cloud networking (VPC) | Day 48 + K8s networking days | ⚠️ partial — one day; lean on SAA prep |
| **Python automation** | job_digest.py appears D5/D32 but no dedicated track | ❌ **Ring 2** |
| **Ansible / config mgmt** | not present | ❌ **Ring 2** (common in postings, rarely a junior gate) |
| DevSecOps | D8 (scanning), D33–34 (pipeline secrets), D52 (KMS) | ⚠️ partial — adequate junior, light for mid |
| Incident management / on-call | Break-fix days 20, 29 + 9 yrs of the real thing | ✅✅ from experience |
| Portfolio + system-design narrative | Friday milestones, capstone D56–58, mocks D59 | ✅ |

## 3. Verdict

The curriculum **fully covers junior expectations and reaches well into mid** (K8s depth, Helm authoring, Terraform modules, Prometheus/Grafana are all named mid-level skills). Combined with 9 years of production support — incident management, escalation, observability, enterprise SaaS context — the honest positioning after Day 60 is: **apply to mid-level DevOps/Platform/SRE roles, accept junior-titled roles only at strong companies with fast leveling.** Senior is a years-of-scope question; no 12-week program claims it, and anyone who says otherwise is selling something.

The two real gaps vs. mid-level postings are Python automation and Ansible — both deliberately deferred to Ring 2 rather than diluting the 60 days.

## 4. SRE adjacency — yes, and it's the shorter bridge

DevOps and SRE overlap ~80% at the skills level (same stack: K8s, Terraform, CI/CD, monitoring). The SRE-specific delta is a *discipline*, not a toolset: **SLIs/SLOs and error budgets** (reliability as a number that gates feature work), **formalized incident response and blameless postmortems**, **toil measurement and elimination**, and a stronger production-code expectation.

Troy's asymmetry: most DevOps candidates have never carried a pager. He has years of incidents, escalations, and Sev-1 pressure — the part of SRE that can't be learned from a course. The delta he's missing is vocabulary and formalism, which IS learnable from a course — or more precisely, a free book.

**SRE reading track (adjacent, not added to the 60 days — 20–30 min, 2–3 evenings/week):**
- [Google SRE Book (free online)](https://sre.google/sre-book/table-of-contents/) — priority chapters: Embracing Risk (error budgets), Service Level Objectives, Eliminating Toil, Being On-Call, Postmortem Culture
- Exercise: retroactively write one blameless postmortem for a real Blockgraph incident (sanitized) — instant portfolio piece and interview story
- Translate one support-era metric into SLI/SLO language ("we answered in X" → "99.9% of requests under Y ms")

Target-title spread after Day 60: DevOps Engineer, SRE, Platform Engineer, Production/Reliability Engineer, Infrastructure Engineer — same resume, adjusted emphasis per posting.

## 5. Ring 2 (post-Day-60, in order)

1. **Python for DevOps** — automation scripts, boto3, rewrite job_digest properly; closes the top mid-level gap
2. **DOP-C02 prep** (~90 days out, per Day 60 checkpoint)
3. **Ansible fundamentals** — config management checkbox for enterprise postings
4. **CKA exam** if the Week 6 decision deferred it; then optionally PCA (Prometheus) — cheap credibility on his strongest suit
5. SLO/postmortem formalization continues from the reading track

## Sources

- [DevOps career progression 2026 (DevOpsBoys)](https://devopsboys.com/blog/devops-engineer-career-progression-junior-to-senior-2026) · [DevOps job market 2026 (HackerX)](https://hackerx.org/devops-job-market-2026-trends-and-opportunities/) · [Career ladder (Ambacia)](https://ambacia.eu/careers-post/devops-career-ladder-from-junior-to-principal/) · [Tech stack by level (Kubeify)](https://shyam.kubeify.com/2025/04/devops-engineer-tech-stack-junior-vs.html)
- [SRE vs DevOps (Spacelift)](https://spacelift.io/blog/sre-vs-devops) · [SRE vs DevOps (Netdata)](https://www.netdata.cloud/academy/sre-vs-devops-what-are-the-main-differences-between-them/) · [Google SRE Book](https://sre.google/sre-book/table-of-contents/)
