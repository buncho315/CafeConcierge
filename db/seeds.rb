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

  # EndUser.create!(
  # [
  #   {
  #     email: 'test1@test1',
  #     name: 'テスト太郎',
  #     first_name_kana: 'テストタロウ',
  #     postal_code: '1111111',
  #     telephone_number: '1111111',
  #     password: '1111111'

  #   },
  #   {
  #     email: 'test2@test2',
  #     name: 'テスト花子',
  #     first_name_kana: 'テストハナコ',
  #     postal_code: '2222222',
  #     telephone_number: '2222222',
  #     password: '2222222'
  #   }
  # ]
  # )