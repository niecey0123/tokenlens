"""
TokenLens Non-Blocking Telemetry Emitter Example
Appends lightweight step-level telemetry to any Python / n8n / LangChain AI pipeline.
"""

import json
import time
import urllib.request
from datetime import datetime, timezone


def emit_tokenlens_event(
    webhook_url: str,
    workflow_id: str,
    run_id: str,
    step_name: str,
    step_order: int,
    model_used: str,
    prompt_tokens: int,
    completion_tokens: int,
    latency_ms: int,
    eval_pass: bool = True,
    vector_db_cost_usd: float = 0.0,
    human_rework_required: bool = False,
) -> int:
    payload = {
        "workflow_id": workflow_id,
        "run_id": run_id,
        "timestamp": datetime.now(timezone.utc).isoformat(),
        "step_name": step_name,
        "step_order": step_order,
        "model_used": model_used,
        "prompt_tokens": prompt_tokens,
        "completion_tokens": completion_tokens,
        "vector_db_cost_usd": vector_db_cost_usd,
        "latency_ms": latency_ms,
        "eval_pass": eval_pass,
        "human_rework_required": human_rework_required,
    }

    req = urllib.request.Request(
        webhook_url,
        data=json.dumps(payload).encode("utf-8"),
        headers={"Content-Type": "application/json"},
        method="POST",
    )
    with urllib.request.urlopen(req, timeout=2.0) as resp:
        return resp.status


if __name__ == "__main__":
    start = time.time()
    sample = {
        "workflow_id": "wf_call_eval_v4",
        "run_id": "run_demo_001",
        "step_name": "Step 2: Policy Tagging",
        "step_order": 2,
        "model_used": "claude-haiku-5-5",
        "prompt_tokens": 1420,
        "completion_tokens": 185,
        "latency_ms": int((time.time() - start) * 1000) + 210,
        "eval_pass": True,
    }
    print("Sample TokenLens Telemetry Payload:")
    print(json.dumps(sample, indent=2))
