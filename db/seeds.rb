class Seed
  def initialize
    @num_stores = 20
    generate_users
    generate_items
    generate_orders
    generate_stores
  end

  def generate_users
    50.times do |i|
      user = User.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email
        )
      puts "User #{i}: #{user.name} - #{user.email} created!"
    end
  end

  def generate_items
    500.times do |i|
      item = Item.create!(
        name: Faker::Commerce.product_name,
        description: Faker::Lorem.paragraph,
        image_url: "http://robohash.org/#{i}.png?set=set2&bgset=bg1&size=200x200",
        store_id: rand(1..@num_stores)
        )
      puts "Item #{i}: #{item.name} created!"
    end
  end

  def generate_orders
    100.times do |i|
      user  = User.find(Random.new.rand(1..50))
      order = Order.create!(user_id: user.id)
      add_items(order)
      puts "Order #{i}: Order for #{user.name} created!"
    end
  end

  def generate_stores
    @num_stores.times do |i|
      Store.create(name: Faker::Company.name)
    end
  end

  private

  def add_items(order)
    10.times do |i|
      item = Item.find(Random.new.rand(1..500))
      order.items << item
      puts "#{i}: Added item #{item.name} to order #{order.id}."
    end
  end
end

Seed.new
