class PlotsController < ApplicationController
  def index
    @addresses = []
    ip_addrs = params[:ip_address].gsub(/\s+/, "").split(",")

    client = IpLocator::Client.new
 
    ip_addrs.each do |ip|
      address = client.lookup_address ip
      @addresses << address
    end

    respond_to do |format|
      format.html
      format.json { render :json => { success: true, addresses: @addresses } }
    end

    rescue => ex
      render :json => { success: false, errors: { msg: ex.message } }
  end

  def create
    addresses = []
    ip_addrs = params[:ip_address].gsub(/\s+/, "").split(",")
    
    client = IpLocator::Client.new
     
    ip_addrs.each do |ip|
      address = client.lookup_address ip
      addresses << address
    end

    render :json => { success: true, addresses: addresses }

    rescue => ex
      render :json => { success: false, errors: { msg: ex.message } }
  end
end
