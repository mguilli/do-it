require 'faker'

2.times do |i|
  2.times do |j| 
    List.create( label: "User#{i+1}_List#{j+1}" )
    3.times do |k|
      item = Item.create(
        name: "User#{i+1}_List#{j+1}_Item#{k+1}",
        list_id: j+1,
      )

      if i == 1
        item.list_id += 2
      end

      item.update_attribute(:created_at, rand(10.minutes .. 6.days).ago)
    end
  end
end

puts "Seed finished"
puts "#{List.count} lists created."
puts "#{Item.count} items created."