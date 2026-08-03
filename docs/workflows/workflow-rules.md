# Workflow Rules

## Rule 1

Một Workflow chỉ có một nhiệm vụ.

## Rule 2

Không chứa Prompt.

## Rule 3

Không chứa API Key.

## Rule 4

Không chứa Business Logic.

## Rule 5

Có Error Handling.

## Rule 6

Có Retry.

## Rule 7

Có Logging.

## Rule 8

Có Version.

## Rule 9

Có Documentation.

## Rule 10

Truoc khi chuyen trang thai sang Active trong workflow-list.md, phai doi chieu du:
- Tat ca cot trong node Insert/Update Postgres phai khop du voi cot trong schema DB that (khong duoc thieu cot, du la cot khong bat buoc — n8n se tu dien NULL am tham, khong bao loi).
- Chi giu dung 1 phien ban file JSON dang hoat dong that trong thu muc workflows/ tuong ung. Cac phien ban cu chuyen vao workflows/_archive/, khong xoa han (giu lai de tham khao lich su).
- Da test voi du lieu that (khong chi pinData/du lieu mau).
