class SeedService
  class << self
    require 'faker'

    def create
      ip_adreesses = set_ip_addreesses
      (0..99).each do |i|
        p "start create user with id #{i}"
        user = User.create(set_users(ip_adreesses))
        p "END CREATE USER with id #{i}"
        p "----------------------------"
        p user.errors.full_messages
      end
    end

    private

    def set_users(ip_adreesses)
      {login: Faker::Name.unique.name, posts_attributes: set_posts(ip_adreesses)}
    end

    def set_posts(ip_adreesses)
      posts_hash = {}
      (0..1999).each do |i|
        p i
        p "-----start create post--------"
        posts_hash[i] = {
            title: Faker::Movies::HarryPotter.location,
            description: Faker::Movies::HarryPotter.quote,
            ip_addreess: ip_adreesses[rand(0..49)],
            evaluations_attributes: set_evaluations
        }
        p "-----end create post--------"
      end

      p "-----END CREATE POSTS--------"

      posts_hash
    end

    def set_evaluations
      evaluations_hash = {}
      (0..4).each do |i|
        evaluations_hash[i] = {
            value: rand(1..5)
        }
      end
      evaluations_hash
    end

    def set_ip_addreesses
      p "start create ip_addreesses"
      ip_adreesses = []
      (0..49).each do |i|
        ip_adreesses << Faker::Internet.ip_v4_address
      end
      p "end create ip_addreesses"
      p "----------------------------"
      ip_adreesses
    end
  end
end