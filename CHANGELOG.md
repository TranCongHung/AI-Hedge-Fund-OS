# Changelog
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