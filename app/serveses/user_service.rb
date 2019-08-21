module UserService
  class << self

    def add_ip_address user, ip_addreess
      ip_addresses_array = user.ip_addresses.pluck(:value)
      unless ip_addresses_array.include?(ip_addreess)
        user.ip_addresses.new(value: ip_addreess, login: user.login)
        user.save
      end
    end

  end
end