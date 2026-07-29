-- Migration 011: AI Debate - luu lai qua trinh tranh luan de xem lai
ALTER TABLE final_decisions ADD COLUMN IF NOT EXISTS debated_technical_signal TEXT;
ALTER TABLE final_decisions ADD COLUMN IF NOT EXISTS debated_technical_confidence INTEGER;
ALTER TABLE final_decisions ADD COLUMN IF NOT EXISTS debate_reason TEXT;
