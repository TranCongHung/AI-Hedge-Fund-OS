-- Migration 004: Backtest Engine (Sprint 12)
CREATE TABLE IF NOT EXISTS backtest_trades (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    symbol TEXT NOT NULL,
    timeframe TEXT NOT NULL,
    strategy TEXT NOT NULL DEFAULT 'ema_cross_sr_atr',
    direction TEXT NOT NULL,          -- BUY / SELL
    entry_time TIMESTAMP NOT NULL,
    entry_price NUMERIC NOT NULL,
    sl1 NUMERIC,
    sl2 NUMERIC,
    tp1 NUMERIC,
    tp2 NUMERIC,
    outcome TEXT,                     -- TP1_HIT / TP2_HIT / SL1_HIT / SL2_HIT / OPEN_AT_END
    exit_time TIMESTAMP,
    exit_price NUMERIC,
    rr_achieved NUMERIC,              -- ty le risk:reward dat duoc thuc te
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS backtest_summary (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    symbol TEXT NOT NULL,
    timeframe TEXT NOT NULL,
    strategy TEXT NOT NULL DEFAULT 'ema_cross_sr_atr',
    total_trades INTEGER,
    wins INTEGER,
    losses INTEGER,
    open_trades INTEGER,
    win_rate_pct NUMERIC,
    avg_rr_achieved NUMERIC,
    period_start TIMESTAMP,
    period_end TIMESTAMP,
    created_at TIMESTAMP DEFAULT NOW()
);
