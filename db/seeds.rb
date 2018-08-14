# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 記事
article = Article.create(title: '記事１', description: '記事１説明')
# カテゴリ（３世代）
category1 = Category.create(title: 'カテゴリ１（親）', description: 'カテゴリ１説明（親）')
category2 = Category.create(title: 'カテゴリ２（子）', description: 'カテゴリ２説明（子）')
category3 = Category.create(title: 'カテゴリ３（孫）', description: 'カテゴリ３説明（孫）')
category1.children << category2
category2.children << category3
# タグ
tag1 = Tag.create(title: 'タグ１', description: 'タグ１説明')
tag2 = Tag.create(title: 'タグ２', description: 'タグ２説明')
tag3 = Tag.create(title: 'タグ３', description: 'タグ３説明')
# 記事-カテゴリリレーション
article.category = category1
# 記事-タグリレーション
article.tags << tag1
article.tags << tag2
article.tags << tag3