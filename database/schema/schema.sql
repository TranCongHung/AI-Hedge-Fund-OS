CREATE TABLE IF NOT EXISTS market_data (
    id BIGSERIAL PRIMARY KEY,
    symbol VARCHAR(20) NOT NULL,
    open_time TIMESTAMP NOT NULL,
    open NUMERIC,
    high NUMERIC,
    low NUMERIC,
    close NUMERIC,
    volume NUMERIC,
    source VARCHAR(20) DEFAULT 'binance',
    created_at TIMESTAMP DEFAULT NOW(),
    UNIQUE (symbol, open_time, source)
);