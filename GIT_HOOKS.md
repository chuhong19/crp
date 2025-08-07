# Git Hooks Setup

## Pre-commit Hook

Dự án này đã được thiết lập với một pre-commit hook để đảm bảo code được format tự động trước khi commit cho tất cả services.

### Cách hoạt động

1. **Tự động format**: Mỗi khi bạn chạy `git commit`, hook sẽ tự động chạy `make format` để format code cho tất cả services
2. **Kiểm tra format**: Sau khi format, hook sẽ chạy `make check` để đảm bảo code đã được format đúng
3. **Tự động add**: Các file đã được format sẽ được tự động add vào commit
4. **Block commit nếu có lỗi**: Nếu có lỗi format, commit sẽ bị từ chối

### Cấu trúc dự án

```
crp/
├── Makefile              # Root Makefile - quản lý tất cả services
├── crp-backend/
│   ├── Makefile         # Backend-specific Makefile
│   └── ...
├── crp-<another-service>/
│   ├── Makefile         # <Another>-specific Makefile
│   └── ...
└── .git/hooks/
    └── pre-commit       # Git hook
```

### Các lệnh có sẵn

#### Root level (cho tất cả services)

```bash
# Format tất cả services
make format

# Kiểm tra format tất cả services
make check

# Build tất cả services
make build

# Test tất cả services
make test

# Clean tất cả services
make clean

# Install dependencies tất cả services
make install

# Chạy service cụ thể
make run SERVICE=crp-backend
make run SERVICE=crp-frontend
```

#### Service-specific

```bash
# Backend commands
make -C crp-backend format
make -C crp-backend check
make -C crp-backend run

# Frontend commands
make -C crp-frontend format
make -C crp-frontend check
make -C crp-frontend run
```

### Commit workflow

```bash
# Commit (sẽ tự động format tất cả services trước)
git commit -m "your message"
```

### Troubleshooting

Nếu pre-commit hook bị lỗi:

1. Chạy `make format` để format code thủ công
2. Chạy `make check` để kiểm tra
3. Thử commit lại

### Disable hook tạm thời

Nếu cần commit mà không format (không khuyến khích):

```bash
git commit --no-verify -m "your message"
```

### Cài đặt hook cho developer mới

Khi clone repo mới, hook sẽ được copy tự động. Nếu không, chạy:

```bash
chmod +x .git/hooks/pre-commit
```

### Thêm service mới

1. Tạo thư mục service mới (ví dụ: `crp-api`)
2. Tạo `Makefile` trong thư mục service với các target: `format`, `check`, `build`, `test`, `clean`, `run`
3. Thêm service vào biến `SERVICES` trong root `Makefile`
