# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
  email: "test@test",## 任意のメールアドレス,
  password: "123123"## 任意のパスワード
  )

User.create!(
  [
    {email: "t@t", name: "鯛", profile: "鯛焼きです。", password: "123123"},
    {email: "a@a", name: "鮎", profile: "魚で占ったから鮎", password: "123123"},
    {email: "m@m", name: "鮪", profile: "魚の代表とよく聞きます。", password: "123123"}
  ]
)

Attempt.create!(
  [
    {user_id:1, content: "テストを頑張る！", is_published_flag:true, part:0} 
  ]
)

Tag.create!(
 [
   {tag_type: "test1"},
   {tag_type: "test2"},
   {tag_type: "test3"},
   {tag_type: "test4"},
   {tag_type: "test5"},
   {tag_type: "test6"}
  ]
)

AttemptAndTag.create!(
  [
    {attempt_id: 1, tag_id: 1}
  ]
)
