# Changelog
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