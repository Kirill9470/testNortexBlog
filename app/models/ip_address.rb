class IpAddress < ApplicationRecord
  belongs_to :user

  def self.get_ip
    select("value", "array_agg(distinct login) AS array_logins").group("value")
  end
end
