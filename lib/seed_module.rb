module SeedModule # оставил сервис для сида чтобы отделить
  class << self
    require 'faker'

    def create_users(count) # Создаем пользователей
      range = count - User.count
      users_array = []
      (1..range).each do |i|
        users_array << {login: Faker::Name.unique.name}
      end
      p "----------------------------"
      p "Создаем #{count} пользователей"
      User.create(users_array)
    end

    def create_posts(count, pa_max_count) # Создаем посты
      ip_adreesses = generate_ip_addresses
      posts_array = []
      range = count - Post.count
      (1..range).each do |i|
        post_hash = {
            title: Faker::Movies::HarryPotter.location,
            description: Faker::Movies::HarryPotter.quote,
            ip_address: ip_adreesses[rand(0..49)],
            user_id: User.all[rand(0..(User.all.count - 1))].id,
            evaluations_attributes: create_evaluations
        }
        posts_array << post_hash
        if posts_array.count == pa_max_count
          p "----------------------------"
          p "Создаем #{posts_array.count} постов"
          Post.create(posts_array)
          posts_array = []
          p "Осталось #{count - Post.count} постов"
        end
      end
    end

    private

    def create_evaluations # Создаем оценки для поста от 1 до 5, с оценкой от 1 до 5
      evaluations_hash = {}
      (0..rand(1..4)).each do |i|
        evaluations_hash[i] = {
            value: rand(1..5)
        }
      end
      evaluations_hash
    end

    def generate_ip_addresses # Создаем 50 рандомных ip адресов
      p "----------------------------"
      p "Создаем 50 рандомных ip адресов"
      ip_addresses = []
      (1..50).each do |i|
        ip_addresses << Faker::Internet.ip_v4_address
      end
      ip_addresses
    end

  end
end