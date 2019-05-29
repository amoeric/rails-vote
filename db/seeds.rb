
5.times { 
    email = Faker::Internet.email
    if not User.find_by(email: email)
        User.create(email: email, password: '123456')
    end
}
