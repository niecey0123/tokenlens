-- TokenLens Core PostgreSQL / Supabase Schema

CREATE TABLE model_pricing (
    model_id TEXT PRIMARY KEY,
    provider TEXT NOT NULL,
    tier TEXT NOT NULL CHECK (tier IN ('frontier', 'balanced', 'lightweight')),
    input_cost_per_mtok NUMERIC(10, 4) NOT NULL,
    output_cost_per_mtok NUMERIC(10, 4) NOT NULL,
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE workflows (
    workflow_id TEXT PRIMARY KEY,
    workflow_name TEXT NOT NULL,
    baseline_human_minutes NUMERIC(6, 2) NOT NULL,
    loaded_hourly_rate_usd NUMERIC(8, 2) NOT NULL,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE telemetry_events (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    workflow_id TEXT REFERENCES workflows(workflow_id),
    run_id TEXT NOT NULL,
    step_name TEXT NOT NULL,
    step_order INT NOT NULL,
    model_used TEXT REFERENCES model_pricing(model_id),
    prompt_tokens INT NOT NULL,
    completion_tokens INT NOT NULL,
    vector_db_cost_usd NUMERIC(10, 6) DEFAULT 0,
    latency_ms INT NOT NULL,
    eval_pass BOOLEAN NOT NULL DEFAULT TRUE,
    human_rework_required BOOLEAN NOT NULL DEFAULT FALSE,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Seed Reference Pricing
INSERT INTO model_pricing (model_id, provider, tier, input_cost_per_mtok, output_cost_per_mtok) VALUES
('claude-opus-5-5', 'Anthropic', 'frontier', 4.00, 20.00),
('gpt-6-astra', 'OpenAI', 'frontier', 10.00, 50.00),
('gemini-4-hydrogen', 'Google', 'balanced', 1.50, 7.50),
('claude-haiku-5-5', 'Anthropic', 'lightweight', 0.10, 0.50);
