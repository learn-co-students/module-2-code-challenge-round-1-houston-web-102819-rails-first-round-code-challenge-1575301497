class HeroinesController < ApplicationController
  def index
    @heroines = Heroine.all
  end

  def show
    @heroine = Heroine.find(params[:id])
    @power = @heroine.power
  end

  def new
    @heroine = Heroine.new
    @powers = Power.all
  end

  def create
    if !Heroine.all.find_by({super_name: params[:heroine][:super_name]})
      Heroine.create({name: params[:heroine][:name], super_name: params[:heroine][:super_name], power_id: params[:heroine][:power_id]})
    end
  end

  def search
    @search = params[:search]
    @found_items = []
    Heroine.all.each do |heroine|
      if params[:search] == heroine.power.name
        @found_items << heroine
      end
    end
  end

  #can't get this to work :(
  def filtered_params
    params.permit({
      power: [
        :name,
        :super_name,
        :power_id,
      ]
    })
  end
end
