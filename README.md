# sql-for-soc
Security Operations Center query library using PostgreSQL — hands-on log triage, threat detection, and alert tagging with real SOC logic.

# 🛡️ SQL for SOC Analysts & Security Engineers – Progress Map

## 👤 Student Profile

- Background: Intermediate beginner
- Focus: Cybersecurity – SOC Analyst / Security Engineer
- Primary Language: SQL (PostgreSQL or SQLite)
- Platform: VS Code / Online Sandbox / Docker PostgreSQL (ARM64 compatible)

---

## 📅 Week 1: SQL Fundamentals – Filtering & Basic Logic

| Day | Concept                 | Focus                            | Status     |
| --- | ----------------------- | -------------------------------- | ---------- |
| 1   | SELECT, WHERE, LIKE     | Filter failed logins & endpoints | ✅ Done   |
| 2   | CASE, ORDER BY, LIMIT   | Labeling & sorting alerts        | ✅ Done   |
| 3   | IN, BETWEEN, NULL       | Refining searches                | ✅ Done   |
| 4   | INSERT, UPDATE, DELETE  | Working with incident records    | ✅ Done   |
| 5   | Practice SOC Query Set  | Hands-on scenario queries        | ✅ Done   |
| 6   | Recap & mini-challenge  | Build a triage query library     | ✅ Done   |
| 7   | Optional: SQLite bridge | Run queries in SQLite            | ❌        |

---

## 🧠 Learning Outcomes

- Write SQL to find brute force attacks, failed logins, and endpoint abuse
- Create logic with CASE and filter with LIKE
- Practice with real SOC-style datasets
- Understand how SQL powers SIEM tools and alert logic

---

## 📦 Dataset

**Table:** logins

- username TEXT
- ip_address TEXT
- status TEXT
- path TEXT
- timestamp TIMESTAMP

---

## 📌 Progress Log

Each day included 5 exercises + 1 bonus, covering:
- Alert detection
- Login triage
- Risk tagging
- Dashboard design
- SOC-style workflows

All queries stored in `sql_for_soc_queries.sql`
