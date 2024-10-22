class CustomersController < ApplicationController
  def index
    if params[:search]
      @customers = Customer.search(params[:search])
    else
      @customers = Customer.all
    end
  end

  def alphabetized
    @customers = Customer.order(:full_name).page(params[:page])
  end

  def missing_email
    @customers = Customer.where(email: [nil, ""]).page(params[:page])
  end
end
