-- Migration 007: News/RSS Collector (nguon du lieu cho Sentiment Agent tuong lai)
CREATE TABLE IF NOT EXISTS news (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    title TEXT NOT NULL,
    link TEXT NOT NULL UNIQUE,
    source TEXT NOT NULL,
    published_at TIMESTAMP,
    created_at TIMESTAMP DEFAULT NOW()
);
