class StuffsController < ApplicationController
  def index
    @all_stuffs = Stuff.all.order(:name)
    @stuffs = Stuff.all.limit(10).offset(params[:offset]).order(:name)
    @offset = (params[:offset].to_i || 0) + 10
  end
end
