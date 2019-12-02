class HeroinesController < ApplicationController

  def index
    @heroines = Heroine.all
    @powers = Power.all
  end

  def show
    @heroine = Heroine.find_by(id: params[:id])
  end

  def new
    @heroine = Heroine.new
    @powers = Power.all
  end

  def create
    Heroine.all.each do |heroine|
      if params[:heroine][:super_name] == heroine.super_name
        redirect_to '/heroines/error' and return
      end
    end

    Heroine.create({
      name: params[:heroine][:name],
      super_name: params[:heroine][:super_name],
      power_id: params[:heroine][:power_id],
    })
    redirect_to '/heroines/'
  end

  def error
  end
  
end
