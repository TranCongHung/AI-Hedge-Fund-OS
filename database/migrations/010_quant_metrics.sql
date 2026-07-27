-- Migration 010: Quant Engine (Sharpe, Sortino, Max Drawdown, Kelly)
CREATE TABLE IF NOT EXISTS quant_metrics (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    symbol TEXT NOT NULL,          -- ten coin, hoac 'PORTFOLIO' cho toan bo danh muc
    total_trades INTEGER,
    win_rate_pct NUMERIC,
    avg_win_pct NUMERIC,
    avg_loss_pct NUMERIC,
    sharpe_ratio NUMERIC,
    sortino_ratio NUMERIC,
    max_drawdown_pct NUMERIC,
    kelly_pct NUMERIC,
    half_kelly_pct NUMERIC,
    calculated_at TIMESTAMP DEFAULT NOW()
);
