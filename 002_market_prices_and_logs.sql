-- Migration 002: Chuẩn hoá market_prices theo data-dictionary.md + database-standard.md
-- Xoá bảng market_data (sai chuẩn, tạo nhầm ở bước trước) nếu đã lỡ tạo
DROP TABLE IF EXISTS market_data;

-- Cần extension để dùng UUID (theo database-standard.md: Primary Key = UUID)
CREATE EXTENSION IF NOT EXISTS pgcrypto;

CREATE TABLE IF NOT EXISTS market_prices (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    symbol TEXT NOT NULL,
    timeframe TEXT NOT NULL DEFAULT '1m',
    open_time TIMESTAMP NOT NULL,       -- bổ sung: thời điểm của nến (data-dictionary.md thiếu cột này)
    open NUMERIC,
    high NUMERIC,
    low NUMERIC,
    close NUMERIC,
    volume NUMERIC,
    source TEXT DEFAULT 'binance',
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW(), -- theo database-standard.md: Audit Enabled
    deleted_at TIMESTAMP,               -- theo database-standard.md: Soft Delete Enabled
    UNIQUE (symbol, timeframe, open_time, source)
);

-- Bảng log workflow (theo docs/workflows/workflow-log.md: Workflow ID, Timestamp,
-- Duration, Status, Error, Retry Count, Execution ID)
CREATE TABLE IF NOT EXISTS workflow_logs (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    workflow_id TEXT NOT NULL,
    execution_id TEXT,
    status TEXT NOT NULL,          -- success | error
    duration_ms INTEGER,
    retry_count INTEGER DEFAULT 0,
    error_message TEXT,
    created_at TIMESTAMP DEFAULT NOW()
);
