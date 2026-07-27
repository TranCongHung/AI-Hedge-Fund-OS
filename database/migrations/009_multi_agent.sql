-- Migration 009: Multi-Agent Debate (Phase D)
CREATE TABLE IF NOT EXISTS sentiment_assessments (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    signal TEXT NOT NULL,
    confidence INTEGER,
    reason TEXT,
    news_count INTEGER,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS macro_assessments (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    signal TEXT NOT NULL,
    confidence INTEGER,
    reason TEXT,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS final_decisions (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    symbol TEXT NOT NULL,
    technical_signal TEXT,
    technical_confidence INTEGER,
    sentiment_signal TEXT,
    macro_signal TEXT,
    final_signal TEXT NOT NULL,
    final_confidence INTEGER,
    reason TEXT,
    created_at TIMESTAMP DEFAULT NOW()
);
