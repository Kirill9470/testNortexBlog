class IpAddress < ApplicationRecord
  belongs_to :user

  def self.where_many_users
    select("value", "array_agg(distinct login) AS logins_array").having("array_upper(array_agg(distinct login), 1) > 1").group("value")
  end
end
