Product.delete_all

50.times do |n|
  name = Faker::Movie.quote

  Product.seed(:id,
    {
      id: n + 1,
      name: name,
      slug: name.parameterize,
      code: "SKU-00#{n+1}",
      quantity: [*100...1000].sample,
      price: [*104343...545421].sample,
      available_on: Time.current
    }
  )
end