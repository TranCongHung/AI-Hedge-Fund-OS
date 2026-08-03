-- Migration 013: Bang risk_adjusted_decisions cho WF-060 Manager AI
-- Ket hop final_decisions (WF-023 Investment Committee) + risk_assessments (WF-050 Risk AI)
-- de ra tin hieu cuoi cung da dieu chinh theo rui ro + ty le von de xuat (position size).

CREATE TABLE IF NOT EXISTS risk_adjusted_decisions (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    symbol TEXT NOT NULL,

    -- Du lieu goc tu final_decisions (WF-023)
    original_signal TEXT,
    original_confidence NUMERIC,

    -- Du lieu goc tu risk_assessments (WF-050)
    risk_level TEXT,
    risk_score NUMERIC,
    atr_regime TEXT,

    -- Ket qua sau khi ap luat dieu chinh rui ro
    adjusted_signal TEXT NOT NULL,
    adjusted_confidence NUMERIC,
    position_size_pct NUMERIC,
    reason TEXT,

    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW(),
    deleted_at TIMESTAMP
);

CREATE INDEX IF NOT EXISTS idx_risk_adjusted_decisions_symbol_created
    ON risk_adjusted_decisions (symbol, created_at DESC);
