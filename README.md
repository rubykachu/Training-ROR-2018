## Nội dung bài tập:

Tạo trang bán hàng đơn giản, gồm các chức năng CRUD của các module:

- Users (id, email, password, role)
	- Role: Phải là admin thì mới được vào trang admin
- Taxonomies (id, name, code, position)
- Products (id, name, price, image, quantity, available_on, discontinue_on)
	- available_on: Ngày bán
	- discontinue_on: Ngày kết thúc (có thể NULL)
- Taxonomies_products(id, taxonomy_id, product_id)
- Orders (id, user_id, code, email, total_payment)
	- Email: Không đăng nhập có thể order
- Line_items (id, order_id, product_id, price, quantity)


**ERD:**

![Untitled](https://user-images.githubusercontent.com/26104119/86875961-df1a4d80-c10d-11ea-836a-066c5d2b8d77.png)

## Cài đặt

**Dependencies**

- Ruby version ~> 2.5
- Rails 5.1
- Postgresql ~> 9

**Setup**

- rails db:create && rails db:migrate && rails db:seed_fu

## Thông tin

**Account login:**

admin: admin@tomosia.com - Abc123@@@
user: guest-0@tomosia.com đến guest-4@tomosia.com. Pass: Abc123@@@
