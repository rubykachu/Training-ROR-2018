Order.destroy_all

User.all.each_with_index do |user, i|
  random_offset = rand(Product.count)
  products = Product.offset(random_offset).limit([*1..5].sample)

  ActiveRecord::Base.transaction do
    total_payment = 0
    products.each { |product| total_payment += product.price }

    # Create Order
    history_order = user.orders.create! code: "COR-00#{i}", total_payment: total_payment, email: user.email, completed_at: Time.current
    current_order = user.orders.create! code: "COR-00#{i}", total_payment: total_payment, email: user.email, completed_at: nil

    # Create Item
    products.each do |product|
      history_order.line_items.create! product_id: product.id, price: product.price, quantity: 1
      current_order.line_items.create! product_id: product.id, price: product.price, quantity: 1
    end
  end
end