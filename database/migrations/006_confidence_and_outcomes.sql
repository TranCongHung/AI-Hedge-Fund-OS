-- Migration 006: Confidence Score + Signal Outcome Tracking (Paper Trading)
ALTER TABLE signals ADD COLUMN IF NOT EXISTS confidence INTEGER;

CREATE TABLE IF NOT EXISTS signal_outcomes (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    signal_id UUID REFERENCES signals(id),
    symbol TEXT NOT NULL,
    signal TEXT NOT NULL,
    confidence INTEGER,
    price_at_signal NUMERIC,
    price_evaluated NUMERIC,
    pct_change NUMERIC,
    outcome TEXT,              -- CORRECT / INCORRECT / NEUTRAL
    evaluated_at TIMESTAMP DEFAULT NOW(),
    created_at TIMESTAMP DEFAULT NOW()
);
