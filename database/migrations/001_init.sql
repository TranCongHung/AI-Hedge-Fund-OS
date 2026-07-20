-- Initial Migration

CREATE TABLE market_prices (

    id UUID PRIMARY KEY,

    symbol TEXT,

    timeframe TEXT,

    open NUMERIC,

    high NUMERIC,

    low NUMERIC,

    close NUMERIC,

    volume NUMERIC,

    created_at TIMESTAMP
);