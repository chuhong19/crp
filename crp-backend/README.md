# CRP Backend

Spring Boot application với PostgreSQL database và Liquibase migration.

## Cài đặt và Chạy

### Yêu cầu

- Java 17+
- Docker và Docker Compose
- Gradle

### Khởi động Database

1. **Khởi động PostgreSQL:**

```bash
make db-up
```

2. **Chạy Liquibase migration:**

```bash
make db-migrate
```

3. **Kiểm tra trạng thái migration:**

```bash
make db-status
```

**Lưu ý:** Migration sẽ tự động chạy khi application khởi động lần đầu tiên.

### Chạy Application

```bash
make run
```

Application sẽ chạy tại `http://localhost:8080`

## Database Commands

| Command            | Mô tả                                                  |
| ------------------ | ------------------------------------------------------ |
| `make db-up`       | Khởi động PostgreSQL database                          |
| `make db-down`     | Dừng PostgreSQL database                               |
| `make db-reset`    | Reset database (xóa volumes và tạo lại)                |
| `make db-migrate`  | Chạy Liquibase migration (khởi động app ngắn để apply) |
| `make db-status`   | Kiểm tra changeSet pending (Gradle Liquibase `status`) |
| `make db-validate` | Validate changelog (Gradle Liquibase `validate`)       |
| `make db-history`  | Xem lịch sử changeSet đã apply (Gradle `history`)      |

### Liquibase với Gradle

- Các lệnh trên sử dụng Gradle Liquibase plugin:
  - `make db-status` → `./gradlew status`
  - `make db-validate` → `./gradlew validate`
  - `make db-history` → `./gradlew history`
- Biến môi trường (tuỳ chọn) để cấu hình kết nối DB khi chạy các lệnh trên:
  - `DB_URL` (mặc định: `jdbc:postgresql://localhost:5432/crp_db`)
  - `DB_USERNAME` (mặc định: `giabao`)
  - `DB_PASSWORD` (mặc định: `giabao123`)

## Database Configuration

- **Host:** localhost:5432
- **Database:** crp_db
- **Username:** giabao
- **Password:** giabao123

## API Endpoints

- `GET /api/users` - Lấy danh sách users
- `GET /api/users/{id}` - Lấy user theo ID
- `POST /api/users` - Tạo user mới
- `GET /api/users/count` - Đếm số lượng users

## Liquibase Migration

Các file migration được lưu trong `src/main/resources/db/changelog/`:

- `db.changelog-master.yaml` - File master changelog
- `changes/001-initial-schema.sql` - Schema ban đầu
- `changes/002-add-products.sql` - Thêm bảng products và index

Để thêm migration mới, tạo file SQL changelog mới và include vào master changelog.
