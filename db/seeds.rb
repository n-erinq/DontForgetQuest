# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
p '==================== award create ===================='
Award.create!(prize: "好きなコンビニスイーツを買おう", required_checks: :days_3)
Award.create!(prize: "ちょっと高いお酒を買おう", required_checks: :days_3)
Award.create!(prize: "何もせずたくさん寝ちゃおう", required_checks: :days_3)
Award.create!(prize: "ちょっと良いレストランに行こう", required_checks: :weeks_3)
Award.create!(prize: "気になる場所に行ってみよう", required_checks: :weeks_3)
Award.create!(prize: "プチプラアクセを買おう", required_checks: :weeks_3)
Award.create!(prize: "プチ旅行に行こう", required_checks: :months_3)
Award.create!(prize: "新しいガジェットを買おう", required_checks: :months_3)
Award.create!(prize: "ミニパーティを開こう", required_checks: :months_3)

p '==================== check_item create ===================='
CheckItem.create!(name: "財布")
CheckItem.create!(name: "カギ")
CheckItem.create!(name: "携帯")
CheckItem.create!(name: "ハンカチ")
CheckItem.create!(name: "時計")
CheckItem.create!(name: "お弁当と水筒")
CheckItem.create!(name: "部屋の電気を消す")
CheckItem.create!(name: "洗濯機を回す")
