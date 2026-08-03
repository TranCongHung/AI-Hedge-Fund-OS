# Security Standard

## Nguyen tac chung
- Khong bao gio commit file chua secret that (`.env`, API key, password, token) vao git, du la repo private hay public.
- Moi secret phai di qua `.env` (khong track) + `.env.example` (track, chi chua placeholder).
- Truoc moi lan `git add .`, chay `git status` va doc ky danh sach file se duoc commit.

## Danh sach file khong duoc commit
- `docker/.env`
- Bat ky file `*.env` nao khong phai `.env.example`
- File chua credential n8n export (n8n khong export password nhung van nen kiem tra lai)

## Xoay vong credential (Credential Rotation)
- Neu phat hien secret bi lo (vi du: lo commit len GitHub, du da xoa o commit sau), phai coi secret do la "da chay" (compromised) vinh vien:
  1. Doi ngay password/key that trong he thong dang chay.
  2. Purge secret khoi lich su git bang `git filter-repo` (khong chi xoa o working tree).
  3. Force-push de ghi de lich su tren remote (chi lam khi chac chan khong co ai khac dang clone/pull repo).

## Docker & Network
- Postgres va cac service noi bo (khong can truy cap tu ben ngoai) nen bind cong vao `127.0.0.1` thay vi `0.0.0.0`, tru khi co ly do ro rang can truy cap tu may khac.
- `N8N_ENCRYPTION_KEY` bat buoc phai la chuoi ngau nhien du dai (>= 32 byte / 64 hex char), khong duoc de placeholder mac dinh trong production.
- Khong duplicate secret cung luc o nhieu noi (vi du: vua hardcode trong `docker-compose.yml` vua co trong `.env`) - chi nen co 1 nguon su that (single source of truth) cho moi secret, tham chieu qua bien moi truong.

## n8n Credentials
- Credential Postgres/API key luu trong n8n duoc ma hoa boi `N8N_ENCRYPTION_KEY`. Neu doi key nay, toan bo credential da luu se khong doc duoc nua - phai nhap lai thu cong sau khi doi key.
- Khong bao gio paste API key that (Groq, Binance, v.v.) vao code node hay bat ky node nao co the bi export/commit - luon dung n8n Credential de luu.

## Checklist truoc khi Active 1 workflow moi
- [ ] Khong co secret nao hardcode truc tiep trong node (Code node, HTTP Request node, v.v.)
- [ ] Tat ca cot insert vao Postgres da duoc doi chieu du voi schema that (tranh bug thieu cot nhu da gap voi WF-001b)
- [ ] Da test voi du lieu that, khong chi voi du lieu mau (pinData)
