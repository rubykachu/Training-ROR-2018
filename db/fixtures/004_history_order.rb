Order.destroy_all

User.all.each_with_index do |user, i|
  random_offset = rand(Product.count)
  products = Product.offset(random_offset).limit([*1..5].sample)

  ActiveRecord::Base.transaction do
    total_payment = 0
    products.each { |product| total_payment += product.price }

    # Create Order
    order = user.orders.create! code: "COR-00#{i}", total_payment: total_payment, email: user.email

    # Create Item
    products.each do |product|
      order.line_items.create! product_id: product.id, price: product.price, quantity: 1
    end
  end
end