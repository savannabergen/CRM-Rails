class CustomersController < ApplicationController
  def index
    if params[:search]
      @customers = Customer.where("lower(full_name) LIKE ?", "%#{params[:search].downcase}%")
    else
      @customers = Customer.all
    end
  end
end
