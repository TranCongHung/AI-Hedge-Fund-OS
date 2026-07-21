-- Migration 003: bảng signals lưu kết quả phân tích của AI (Sprint 10)
CREATE TABLE IF NOT EXISTS signals (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    symbol TEXT NOT NULL,
    signal TEXT NOT NULL,          -- BUY / SELL / HOLD
    reason TEXT,                   -- giải thích ngắn của AI
    price_at_signal NUMERIC,       -- giá tại thời điểm phân tích
    model TEXT DEFAULT 'qwen2.5:3b',
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW(),
    deleted_at TIMESTAMP
);
