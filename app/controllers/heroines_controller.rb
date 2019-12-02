class HeroinesController < ApplicationController
  def index
    @heroines = Heroine.all
  end

  def show
    @heroine = Heroine.find(params[:id])
  end

  def new
    @heroine = Heroine.new
    @powers = Power.all
  end

  def create
    if !(Heroine.find_by(super_name: params[:heroine][:super_name]))
      new_heroine = Heroine.create(permitted_params[:heroine])
      # new_heroine = Heroine.create({ 
      #   name: params[:heroine][:name],
      #   super_name: params[:heroine][:super_name],
      #   power_id: params[:heroine][:power_id],
      # })

      redirect_to "/heroines/#{new_heroine.id}"
    else
      redirect_to "/heroines/new"
    end
    
  end

  def permitted_params
    return params.permit({
      heroine: [
        :name,
        :super_name,
        :power_id
      ]
    })

  end

end
