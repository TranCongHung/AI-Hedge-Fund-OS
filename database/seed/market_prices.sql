INSERT INTO market_prices(

id,

symbol,

timeframe,

open,

high,

low,

close,

volume,

created_at

)

VALUES(

gen_random_uuid(),

'BTCUSDT',

'1h',

100000,

101000,

99500,

100500,

500,

NOW()

);