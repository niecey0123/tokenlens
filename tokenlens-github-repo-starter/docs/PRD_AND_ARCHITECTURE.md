# TokenLens: Product Requirements, Architecture & GTM Specification

## 1. Executive Summary & Problem Statement
**TokenLens** is an AI Workflow Unit-Economics & ROI Intelligence platform that translates raw LLM token telemetry into CFO-ready cost-per-completed-outcome metrics, automated model-routing recommendations, and verified net margin.

### The 2026 Enterprise AI ROI Blind Spot
- **71%** of enterprises track aggregate monthly AI API and cloud inference bills.
- **Only 44%** track per-unit inference cost or map spend to completed business outcomes.
- **Result:** AI initiatives stall in "pilot purgatory" because engineering teams report token volume while CFOs demand unit-level ROI.

---

## 2. Target Personas & Jobs-to-be-Done (JTBD)

1. **Technical Product & Program Managers (TPMs):**
   - *JTBD:* Monitor cost, latency, and quality pass rates per pipeline node to optimize bloated steps without risking accuracy regressions.
2. **Enterprise AI Practice Leads & Consulting Architects:**
   - *JTBD:* Standardize unit-economics governance across client engagements to prove business value and unlock production budgets.
3. **CFOs & FinOps Leaders:**
   - *JTBD:* Inspect verified Cost per Completed Outcome and Net Margin per Run across AI workflows to allocate capital efficiently.

---

## 3. System Architecture

1. **Ingestion Layer (Webhook / n8n Middleware):** Non-blocking asynchronous JSON telemetry emitter appended to each workflow node.
2. **Storage & Pricing Normalization Layer (Supabase / Postgres):** Joins step-level token logs against a live model pricing lookup table and baseline human labor benchmarks.
3. **Optimization & Shadow-Evaluation Engine:** Runs background shadow tests comparing frontier models against lightweight candidates using semantic similarity and LLM-as-a-Judge scoring, surfacing one-click routing recommendations when quality variance stays under 1.0%.
4. **Executive Workstation UI:**
   - **4-Stage Narrative Walkthrough:** Educates stakeholders on the blind spot, node-level attribution, live model-routing simulation ($0.48 -> $0.07), and CFO takeaway.
   - **Free Explore Mode:** Multi-workflow telemetry dashboard (*Automated Call & Audio Evaluation*, *Tier-1 Support Ticket Resolver*, *Contract Risk Extractor*) with one-click Auto-Optimize and CFO Executive Brief export.
