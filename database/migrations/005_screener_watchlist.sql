-- Migration 005: Market Screener + Watchlist (Sprint mở rộng)
CREATE TABLE IF NOT EXISTS screener_raw_scores (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    symbol TEXT NOT NULL,
    score NUMERIC,
    candles_since_cross INTEGER,
    cross_direction TEXT,       -- BUY / SELL / null
    atr_pct NUMERIC,
    trend_pct NUMERIC,
    volume_ratio NUMERIC,
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS watchlist (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    symbol TEXT NOT NULL UNIQUE,
    score NUMERIC,
    cross_direction TEXT,
    active BOOLEAN DEFAULT true,
    added_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);
