class CustomersController < ApplicationController
  def index
    if params[:search]
      @customers = Customer.where("lower(full_name) LIKE ?", "%#{params[:search].downcase}%")
    else
      @customers = Customer.all
    end
  end

  def alphabetized
    @customers = Customer.order(:full_name).paginate(page: params[:page], per_page: 10)
    #@customers = Customer.paginate(page: params[:page], per_page: 10)
  end

  def missing_email
    @customers = Customer.where(email: [ nil, "" ]).paginate(page: params[:page], per_page: 10)
  end
end
