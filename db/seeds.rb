require 'faker'

2.times do |i|
  2.times do |j| 
    List.create( 
      label: "User#{i+1}_List#{j+1}",
      user_id: i+1
    )
    3.times do |k|
      item = Item.create(
        name: "User#{i+1}_List#{j+1}_Item#{k+1}",
        list_id: j+1,
      )

      if i == 1
        item.list_id += 2
      end

      item.update_attribute(:created_at, ( k + 5 ).days.ago)
    end
  end
end

# Create Users
User.create(
  username: 'User1',
  email: 'user1@example.org',
  password: 'password'
)

User.create(
  username: 'User2',
  email: 'user2@example.org',
  password: 'password'
)

users = User.all

#Create Lists and Task Items
# 6.times do
#   List.create(
#     label: Faker::Lorem.sentence,
#     user: users.sample
#   )
# end

# lists = List.all

# 18.times do
#   item = Item.create(
#     name: Faker::Lorem.sentence,
#     list: lists.sample
#   )

#   item.update_attribute(:created_at, rand(10.minutes .. 6.days).ago)
# end


puts "Seed finished"
puts "#{User.count} users created."
puts "#{List.count} lists created."
puts "#{Item.count} items created."