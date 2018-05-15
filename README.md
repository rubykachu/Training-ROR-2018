Nội dung bài tập:
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
