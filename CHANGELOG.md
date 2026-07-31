###Changelog
###v1.8.0
###Added
WF-050 Risk AI: đánh giá rủi ro tự động cho từng coin trong watchlist (volatility, ATR regime, tương quan với BTC, max drawdown lịch sử) → risk_level (LOW/MEDIUM/HIGH) và risk_score (0-100).
Bảng risk_assessments (migration 012_risk_assessments.sql).
###Fixed
WF-001b v2 (watchlist-driven collector): node Insert Market Prices thiếu mapping cột low khi ghi vào market_prices, khiến toàn bộ dữ liệu low của các coin trong watchlist (ngoại trừ BTC/ETH/SOL thu qua WF-001 gốc) bị NULL kể từ khi tạo workflow. Hậu quả: WF-050 không tính được ATR regime (luôn ra "khong_du_du_lieu") cho toàn bộ coin ngoài BTCUSDT.
Đã dọn dữ liệu rác (các dòng market_prices có low IS NULL) và thu thập lại đầy đủ 3 khung thời gian (1h/4h/1d) cho toàn bộ watchlist.
Cập nhật workflow-list.md: WF-001 và WF-050 chuyển trạng thái sang ✅ Active (trước đó bị bỏ sót/ghi sai Planned dù đã hoạt động).
###Note
Bug thiếu cột low tồn tại từ commit gốc tạo WF-001b v2, không phải lỗi phát sinh sau này — bài học: khi thêm cột mới vào bảng DB hoặc thêm field trong Code node, luôn double-check lại đủ mapping ở node Insert (n8n không cảnh báo khi thiếu 1 cột không bắt buộc, nó tự set NULL âm thầm).
## v1.6.0

### Added
- WF-035 Quant Engine: tính Sharpe Ratio, Sortino Ratio, Max Drawdown, Kelly Criterion (và Half-Kelly) cho từng coin và toàn bộ danh mục, dựa trên dữ liệu backtest_trades.
- Bảng quant_metrics.

### Note
- Kết quả ban đầu cho thấy chiến lược EMA-cross + ATR hiện tại chưa có lợi thế thống kê rõ ràng (Sharpe gần 0 hoặc âm) — cần tích luỹ thêm dữ liệu backtest (mẫu hiện tại chỉ 10-20 lệnh/coin) trước khi kết luận, và có thể cần điều chỉnh lại chiến lược.
## v1.5.0

### Added
- WF-021 Sentiment Agent: đánh giá tâm lý thị trường chung từ tin tức 48h qua.
- WF-022 Macro Agent: đánh giá triển vọng vĩ mô chung từ 4 chỉ số kinh tế Mỹ.
- WF-023 Manager (Investment Committee): kết hợp Technical + Sentiment + Macro để ra quyết định cuối cùng cho từng coin, có điều chỉnh confidence dựa trên sự đồng thuận/bất đồng giữa các Agent.
- Bảng sentiment_assessments, macro_assessments, final_decisions.

### Milestone
- Phase D hoàn thành: Multi-Agent Debate thật sự, mỗi Agent có nguồn dữ liệu độc lập (giá/tin tức/vĩ mô), không còn "diễn" trên cùng 1 dữ liệu.
## v1.4.0

### Added
- WF-010 FRED Macro Collector: thu thập 4 chỉ số vĩ mô Mỹ (lãi suất, lạm phát, chỉ số đô la, thất nghiệp) — nền tảng dữ liệu cho Macro Agent (Phase C hoàn thành).
- Bảng macro_data.

### Note
- Phase C (News + Macro data) đã hoàn thành. Đủ điều kiện để triển khai Phase D: tách WF-020 thành Multi-Agent thật (Technical + Sentiment + Macro + Risk + Manager), vì giờ mỗi Agent có nguồn dữ liệu riêng biệt thật sự.
## v1.3.0

### Added
- WF-003 News/RSS Collector: thu thập tin tức crypto từ CoinDesk + CoinTelegraph, lưu vào bảng news.
## v1.2.0

### Added
- WF-020 v5: thêm Confidence Score (0-100) cho mỗi tín hiệu AI, dựa trên độ nhất quán xu hướng giữa các khung thời gian.
- WF-025 Signal Outcome Evaluator: theo dõi tín hiệu AI qua 24 giờ, so sánh giá thật để tính ĐÚNG/SAI — nền tảng cho Paper Trading và đánh giá độ tin cậy AI theo thời gian.
- Bảng signal_outcomes, cột confidence trong bảng signals.

### Note
- Ý tưởng lấy cảm hứng từ phản hồi AI Hedge Fund (mã nguồn mở) — chỉ áp dụng phần phù hợp với kiến trúc hiện tại (Confidence Score + Outcome Tracking), chưa triển khai Multi-Agent Debate vì thiếu nguồn dữ liệu đa dạng (Sentiment/Macro/On-chain) để làm cho việc tách Agent có ý nghĩa thật.
## v1.1.0

### Added
- WF-000 Master Orchestrator: điều phối tự động toàn bộ pipeline, không cần bấm tay từng workflow.
  - Nhánh mỗi giờ: WF-001b (giá) → WF-020 (tín hiệu).
  - Nhánh mỗi ngày 00:00: WF-005 (quét lại watchlist) → WF-001b → WF-020 → WF-030 (backtest).

### Note
- Dùng Schedule Trigger nên chỉ chạy khi máy/Docker đang bật — không phải chạy nền 24/7 thật cho tới khi chuyển sang VPS. Kiến trúc đã sẵn sàng chuyển đổi không cần sửa gì khi có điều kiện.
## v1.0.0

### Added
- WF-080 Dashboard API: 2 webhook endpoint (dashboard-status, dashboard-signals) phục vụ giao diện Dashboard.
- Kết nối giao diện UX_AI-Hedge-Fund-OS (React) với dữ liệu thật: Dashboard, Signals, AIChat.
- Dashboard hiển thị trạng thái Postgres, watchlist, tín hiệu, tỷ lệ thắng backtest — thay thế hoàn toàn số liệu giả (CPU/RAM/GPU mock).

### Fixed
- Khôi phục container Docker sau sự cố bị xoá — dữ liệu được bảo toàn nhờ Docker volume tách biệt.
## v0.9.0

### Added
- WF-070 AI Chat Assistant: chat trực tiếp với trợ lý qua giao diện HTML, kết hợp signals + market_prices, dùng Groq API cho tốc độ phản hồi nhanh (~1 giây).
- Giao diện chat-assistant.html với avatar cute, animation trạng thái.

### Note
- Đã thay thế hoàn toàn kế hoạch Telegram Bot (WF-070 gốc) bằng AI Chat Assistant theo quyết định tại Sprint 9.
## v0.8.0

### Added
- WF-001b v2: tự động lấy dữ liệu lịch sử theo danh sách watchlist động (10 coin do Screener chọn), thay vì viết cứng 3 coin.
- WF-020 v4: chia nhỏ phân tích theo nhóm 5 coin/lần, chuyển từ Qwen local sang Groq API (openai/gpt-oss-20b) — nhanh hơn đáng kể.

### Fixed
- Đồng bộ file WF-005 trên Git về đúng cấu hình 50 coin (trước đó lệch với bản đang chạy).
- Dọn dữ liệu parse_error cũ trong bảng signals (do lỗi credential Groq lúc đầu).

### Note
- Groq free tier: 30 request/phút, ~6.000 token/phút, giới hạn ngày tuỳ model — khối lượng dùng hiện tại của dự án nằm rất xa dưới các mức này.
## v0.7.0

### Added
- WF-005 Market Screener: quét top 50 coin theo thanh khoản trên Binance, tính điểm setup (giao cắt EMA + ATR + xu hướng + khối lượng), tự động chọn ra 10 coin tốt nhất vào bảng watchlist.
- Bảng screener_raw_scores, watchlist.

### Note
- Cần lưu ý selection bias: watchlist chọn theo setup hiện tại, không nên backtest ngay trên chính giai đoạn dữ liệu đã dùng để chọn coin (kết quả sẽ bị ảo quan).
## v0.6.0

### Added
- WF-030 Backtest Engine: tính Entry/SL1/SL2/TP1/TP2 dựa trên giao cắt EMA9/EMA21 + ATR + hỗ trợ/kháng cự, mô phỏng lịch sử để tính tỷ lệ thắng/thua thật.
- Bảng backtest_trades, backtest_summary.

### Note
- Kết quả backtest hiện dựa trên mẫu nhỏ (~1 tháng dữ liệu, vài lệnh/coin) — chưa đủ ý nghĩa thống kê, cần tích luỹ thêm dữ liệu qua nhiều lần chạy WF-001b để đáng tin cậy hơn.

## v0.5.0

### Fixed
- Dọn dữ liệu rác trong market_prices (2793 dòng close=0/open=0 do lỗi mapping cột khi test WF-001b).

### Changed
- WF-020 nâng cấp lên v2.0: phân tích đa khung thời gian (1h/4h/1d) thay vì chỉ 2 giờ gần nhất, cho tín hiệu chính xác hơn nhiều.

## v0.4.0

### Added
- WF-001b Historical Batch Collector: lấy giá lịch sử 1 tháng (nến 1h/4h/1d) theo lô, chạy tay khi có máy.
- WF-020 v2.0: nâng cấp phân tích đa khung thời gian (ngắn/trung/dài hạn) thay vì chỉ 2 giờ gần nhất.
## v0.3.0

### Added
- WF-020 Research AI: đọc market_prices, phân tích bằng Qwen2.5:3B, lưu kết quả vào bảng signals.
- Bảng signals.
## v0.2.0

### Added
## v0.1.0
- Khởi tạo cấu trúc dự án.
- Khởi tạo tài liệu.