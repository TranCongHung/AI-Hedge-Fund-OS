-- Migration 012: Risk Agent (danh gia rui ro dinh luong, khong dung AI)
CREATE TABLE IF NOT EXISTS risk_assessments (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    symbol TEXT NOT NULL,
    volatility_pct NUMERIC,          -- do lech chuan cua % thay doi gia theo gio
    atr_regime TEXT,                 -- 'thap' / 'binh_thuong' / 'tang_cao'
    atr_regime_ratio NUMERIC,        -- ATR hien tai / ATR trung binh 30 ngay
    correlation_btc NUMERIC,         -- -1 den 1, tuong quan voi BTC
    max_drawdown_pct NUMERIC,        -- lay tu quant_metrics neu co
    risk_level TEXT NOT NULL,        -- LOW / MEDIUM / HIGH
    risk_score INTEGER,              -- 0-100, cang cao cang rui ro
    reason TEXT,
    created_at TIMESTAMP DEFAULT NOW()
);
