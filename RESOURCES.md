# Resource Library — Deep Dives by Module

The daily briefing stays at 2–3 links on purpose (one objective, one tab). This is the fuller shelf for when you want depth on your own time. Everything here is free unless marked **[paid]**.

## Docker (Days 1–5)

- [Docker Get Started](https://docs.docker.com/get-started/) — the canonical image/container/registry mental model, from the source
- [Dockerfile reference](https://docs.docker.com/reference/dockerfile/) — every instruction explained; this is what you justify line-by-line in explain-backs
- [Build best practices](https://docs.docker.com/build/building/best-practices/) — layer caching, image size, why naive Dockerfiles balloon
- [Multi-stage builds](https://docs.docker.com/build/building/multi-stage/) — Day 2's core material
- [Play with Docker](https://labs.play-with-docker.com/) — free browser-based Docker terminal, no local install needed
- [Docker Compose docs](https://docs.docker.com/compose/) — Day 3 reference
- 🎥 [TechWorld with Nana](https://www.youtube.com/@TechWorldwithNana) — "Docker Tutorial for Beginners" (~3 h, the most-recommended video intro)
- 🎥 [freeCodeCamp](https://www.youtube.com/@freecodecamp) — "Docker Tutorial for Beginners" full course
- Codecademy: [Intro to Docker](https://www.codecademy.com/learn/ext-courses/working-with-containers-introduction-to-docker) · [Compose](https://www.codecademy.com/article/mastering-docker-compose) · [Networking](https://www.codecademy.com/article/docker-networking) · [DevSecOps and Containers](https://www.codecademy.com/learn/ext-courses/devsecops-and-containers)

## SQL (Days 6, 12, 18–21)

- [SQLBolt](https://sqlbolt.com/) — fastest interactive refresher, browser-based
- [PGExercises](https://pgexercises.com/) — timed-drill-friendly problem sets against a real schema; closest to interview conditions
- [Mode SQL Tutorial](https://mode.com/sql-tutorial) — best free explanations of subqueries, CTEs, and window functions
- [Use The Index, Luke](https://use-the-index-luke.com/) — the indexing-intuition book, free online; Day 20's core material
- 🎥 [freeCodeCamp](https://www.youtube.com/@freecodecamp) — "SQL Tutorial – Full Database Course for Beginners"
- Codecademy: [Analyze Data with SQL path](https://www.codecademy.com/learn/paths/analyze-data-with-sql)

## Kubernetes (Days 7–11)

- [Kubernetes Concepts docs](https://kubernetes.io/docs/concepts/) — Deployments, Services, ConfigMaps, RBAC; the reference you'll live in
- [Killercoda K8s playground](https://killercoda.com/playgrounds/scenario/kubernetes) — free in-browser clusters; also has CKA scenario tracks
- [kind](https://kind.sigs.k8s.io/docs/user/quick-start/) — local cluster in Docker; the Day 11 milestone platform
- [kubectl cheat sheet](https://kubernetes.io/docs/reference/kubectl/quick-reference/) — keep open during labs
- 🎥 [TechWorld with Nana](https://www.youtube.com/@TechWorldwithNana) — "Kubernetes Tutorial for Beginners" (~4 h)
- 🎥 **[paid]** [CKA with Practice Tests (KodeKloud/Mumshad, Udemy)](https://www.udemy.com/course/certified-kubernetes-administrator-with-practice-tests/) — the community-standard CKA course with hands-on labs; buy only during Udemy's constant sales (~$15)
- Codecademy: [Intro to Kubernetes](https://www.codecademy.com/learn/ext-courses/working-with-containers-introduction-to-kubernetes) · [CKA 2024 Cert Prep](https://www.codecademy.com/learn/ext-paths/certified-kubernetes-administrator-cka-2024)

## CI/CD (Days 13–17)

- [GitHub Actions docs](https://docs.github.com/en/actions) — primary reference; start with the quickstart
- [Your own thaddeus-daily workflow](https://github.com/Troyxag/thaddeus-daily/blob/main/.github/workflows/thaddeus-daily.yml) — a pipeline you already own and can dissect
- [docker/build-push-action](https://github.com/docker/build-push-action) — Day 15's building block
- [Blue-green deployment (Fowler)](https://martinfowler.com/bliki/BlueGreenDeployment.html) and [Canary release (Fowler)](https://martinfowler.com/bliki/CanaryRelease.html) — the two Day 16 strategies, from the source
- 🎥 [TechWorld with Nana](https://www.youtube.com/@TechWorldwithNana) — "GitHub Actions Tutorial" (~1 h)
- 🎥 [freeCodeCamp](https://www.youtube.com/@freecodecamp) — CI/CD and GitHub Actions full courses
- Codecademy: [Introduction to DevOps](https://www.codecademy.com/learn/introduction-to-dev-ops) · [Continuous Integration](https://www.codecademy.com/article/continuous-integration) · [CD and Deployment](https://www.codecademy.com/article/continuous-delivery-and-deployment)

## AWS (Days 22+)

- Codecademy: [SAA-C03 Cert Prep](https://www.codecademy.com/learn/ext-paths/saa-c03-aws-certified-solutions-architect-associate) → [DOP-C02 Cert Prep](https://www.codecademy.com/learn/ext-paths/dop-c02-aws-certified-devops-engineer-professional)
- [AWS Skill Builder](https://explore.skillbuilder.aws/) — AWS's own training platform; free tier includes exam-prep material
- [Tutorials Dojo SAA-C03 cheat sheets](https://tutorialsdojo.com/aws-certified-solutions-architect-associate-saa-c03/) — condensed review; their practice exams (**[paid]**, ~$15) are the community standard
- [AWS Well-Architected Framework](https://aws.amazon.com/architecture/well-architected/) — the vocabulary SAA questions are written in
- 🎥 [freeCodeCamp](https://www.youtube.com/@freecodecamp) — Andrew Brown's full SAA-C03 course (free, exam-complete)
- 🎥 **[paid]** [Ultimate AWS SAA-C03 (Stéphane Maarek, Udemy)](https://www.udemy.com/course/aws-certified-solutions-architect-associate-saa-c03/) — the other community standard; sale-priced ~$15

## Certification Targets 🎯

The paper trail this whole curriculum aims at, in order. Prices verified July 2026.

| Cert | Cost | When | Notes |
|---|---|---|---|
| **CKA** (Certified Kubernetes Administrator) | $445 | After Module 1 + CKA prep path | Performance-based — 2 h live terminal, not multiple choice. Price includes **one free retake**, two killer.sh simulator sessions, and 12 months to schedule. Linux Foundation runs frequent 30–50% sales — almost never pay list price. [Register here](https://training.linuxfoundation.org/certification/certified-kubernetes-administrator-cka/) |
| **AWS SAA-C03** (Solutions Architect – Associate) | $150 | Day 22+ phase | The resume-filter cert. Schedule the exam date as soon as you're through the prep path — a booked date is what turns studying into finishing. [Register here](https://aws.amazon.com/certification/certified-solutions-architect-associate/) |
| **AWS DOP-C02** (DevOps Engineer – Professional) | $300 → **~$150** | ~90 days after SAA + CI/CD solid | Passing any AWS exam earns a 50% voucher for the next — so SAA first cuts this in half. Names the target role on paper. |
| CLF-C02 (Cloud Practitioner) | $100 | Only if a posting demands it | Optional checkbox; your hands-on experience already exceeds it. ~9 h prep path if ever needed. |

**No cert needed for:** Docker (the DCA has weak industry signal — your Day 5/17 Dockerfile and pipeline artifacts are the proof) and SQL (no cert matters; timed drill performance in interviews is the proof).

**Realistic total outlay:** ~$745 list, less with Linux Foundation discounts. Sequenced across ~4–6 months, not up front.

## How to update this file or the daily links

Daily briefing links live in `curriculum.json` (each day's `resources` array — first link is the primary). Edit, commit, push; the next 1 PM run picks it up. This file is reference-only; the bot never reads it.
