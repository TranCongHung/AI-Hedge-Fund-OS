# Data Dictionary

## market_prices

| Field | Type | Description |
|-------|------|-------------|
| id | UUID | Primary Key |
| symbol | TEXT | BTCUSDT |
| timeframe | TEXT | 1m / 5m / 1h |
| open | DECIMAL | Open Price |
| high | DECIMAL | High Price |
| low | DECIMAL | Low Price |
| close | DECIMAL | Close Price |
| volume | DECIMAL | Trading Volume |
| created_at | TIMESTAMP | Creation Time |