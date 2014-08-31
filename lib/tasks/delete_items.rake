task delete_items: :environment do
  Item.where("created_at <= ?", 7.days.ago).destroy_all
end

