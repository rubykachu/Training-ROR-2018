User.delete_all
5.times do |n|
  User.create! email: "guest-#{n}@tomosia.com", password: 'Abc123@@@', is_admin: false
end