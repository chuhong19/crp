# Git Hooks Setup

## Pre-commit Hook

Dự án này đã được thiết lập với một pre-commit hook để đảm bảo code được format tự động trước khi commit.

### Cách hoạt động

1. **Tự động format**: Mỗi khi bạn chạy `git commit`, hook sẽ tự động chạy `make format` để format code
2. **Kiểm tra format**: Sau khi format, hook sẽ chạy `make check` để đảm bảo code đã được format đúng
3. **Tự động add**: Các file đã được format sẽ được tự động add vào commit
4. **Block commit nếu có lỗi**: Nếu có lỗi format, commit sẽ bị từ chối

### Các lệnh có sẵn

```bash
# Format code thủ công
make format

# Kiểm tra format
make check

# Commit (sẽ tự động format trước)
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
