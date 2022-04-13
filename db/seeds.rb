admin = User.new(username: 'admin', email: 'admin@mail.com', password: '123456')
admin.add_role(:admin)
admin.save!


