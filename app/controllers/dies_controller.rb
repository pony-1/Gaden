class DiesController < ApplicationController
  before_action :age_check, only: :create
  def index
    @dies = Die.last
  end

  def new
    @die = Die.new
  end

  def create
    y = Die.new(dies_params)
    y.age = 80 - y.age
    if y.save
       redirect_to dies_path
    else
       render 'new'
    end
  end

  private
    def dies_params
      params.require(:die).permit(:age)
    end
    def age_check
      if  params[:die][:age] == ""
         redirect_to new_dy_path
      end
    end
end
