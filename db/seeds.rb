# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
p '==================== check_item create ===================='
CheckItem.create!(name: "財布")
CheckItem.create!(name: "鍵")
CheckItem.create!(name: "携帯")
CheckItem.create!(name: "ハンカチ")
CheckItem.create!(name: "時計")
CheckItem.create!(name: "部屋の電気を消す")
CheckItem.create!(name: "洗濯機を回す")

