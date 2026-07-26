-- Migration 008: FRED Macro Collector (nguon du lieu cho Macro Agent tuong lai)
CREATE TABLE IF NOT EXISTS macro_data (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    series_id TEXT NOT NULL,       -- vd: DFF, CPIAUCSL, DTWEXBGS, UNRATE
    series_name TEXT NOT NULL,
    observation_date DATE NOT NULL,
    value NUMERIC,
    created_at TIMESTAMP DEFAULT NOW(),
    UNIQUE (series_id, observation_date)
);
