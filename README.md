# TokenLens — AI Workflow Unit-Economics & ROI Tracker

> **Turn raw LLM token telemetry into CFO-ready cost-per-completed-outcome metrics, automated model-routing recommendations, and verified net margin.**

![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)
![Focus: AI FinOps & Product Governance](https://img.shields.io/badge/Focus-AI%20FinOps%20%26%20Product%20Governance-emerald.svg)

---

## The Problem: The 2026 Enterprise AI ROI Blind Spot

According to the **2026 Enterprise AI ROI Benchmark**, **71% of organizations** track aggregate monthly AI API and cloud inference bills, yet **only 44%** track per-unit inference cost or tie spend to completed business outcomes.

* **The Engineering Reality:** Infrastructure and product teams receive a $42,000+ monthly inference invoice with aggregate token counts—but zero attribution per workflow step, customer tier, or completed task.
* **The Executive Dilemma:** CFOs and VPs pause AI budgets because technical teams cannot prove whether a multi-step AI pipeline saves more money than it consumes in tokens and human rework.

**TokenLens** bridges the gap between engineering telemetry (tokens, latency, model tiers) and executive financial governance (**Cost per Completed Outcome**, **Net Margin per Run**, and **Annualized Run-Rate Savings**).

---

## Core Unit-Economics Formulas

### 1. Cost per Completed Outcome (`C_outcome`)
Standard observability tools divide total API spend by total pipeline attempts—hiding failed runs, retries, and human rework. TokenLens keeps all failed and retried runs in the numerator while dividing strictly by verified successful outcomes:

```text
C_outcome = [ Total Input Token Cost + Total Output Token Cost + Vector/Tool Overhead ] / Verified Successful Completions
```

### 2. Net Margin per Run (`M_run`)
Measures the true financial value generated per workflow execution against baseline manual labor:

```text
M_run = ( Baseline Human Time Saved in Hours * Loaded Hourly Labor Rate ) - C_outcome
```

### 3. Model Bloat Index (`MBI`)
Flags workflow steps where expensive frontier reasoning models (e.g., Claude Opus 5.5, GPT-6 Astra) are used for deterministic classification, policy tagging, or rubric scoring that can be safely routed to lightweight models (e.g., Claude Haiku 5.5, Gemini 4 Hydrogen):

```text
Model Bloat Index = Current Node Step Cost / Target Optimized Node Step Cost
```

---

## Reference Benchmark: Automated Call & Audio Evaluation Pipeline

| Metric | Unoptimized Production | TokenLens Optimized Routing | Impact |
| :--- | :--- | :--- | :--- |
| **Model Routing** | Frontier model on all 4 steps | Frontier (Step 1) + Lightweight (Steps 2–4) | Right-sized deterministic nodes |
| **Cost per Completed Outcome** | **$0.48 / call** | **$0.07 / call** | **-85.4% Unit Cost** |
| **Evaluated Quality Score** | 99.4% | 99.2% | -0.2% variance (<1% threshold) |
| **Annualized Savings** | Baseline | **+$147,600 / yr** (at 25k/mo) | Direct margin expansion |

---

## Repository Structure

```text
tokenlens/
├── index.html                  # Interactive PrismOS Workstation Demo (export from canvas & drop here)
├── docs/
│   └── PRD_AND_ARCHITECTURE.md # Full Product Requirements, Personas, Formulas & GTM Strategy
├── schema/
│   ├── telemetry_event.json    # Asynchronous Webhook / n8n JSON Telemetry Schema
│   └── supabase_schema.sql     # PostgreSQL / Supabase tables & model pricing lookup schema
├── examples/
│   └── emit_telemetry.py       # Lightweight non-blocking Python telemetry emitter example
├── LICENSE                     # MIT License
└── .gitignore                  # Standard Git ignore rules
```


**Shaniece Crumpler** — Technical Product & Program Manager | AI Orchestration, Cloud Systems & Agile Delivery
