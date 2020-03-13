User.delete_all
User.create! email: 'admin@tomosia.com', password: 'Abc123@@@', is_admin: true
5.times do |n|
  User.create! email: "guest-#{n}@tomosia.com", password: 'Abc123@@@', is_admin: false
end
