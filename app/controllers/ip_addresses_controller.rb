class IpAddressesController < ApplicationController

  def index
    @ip_addresses = IpAddress.where_many_users
  end

end