# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
  Admin.create!(
    email: 'admin@admin',
    password: 'admin1'
  )

  ShopGenre.create([
    { name: '禁煙' },
    { name: '喫煙可' },
    { name: '会話可能'},
    ])
#ジャンルは固定のやつだけ記述