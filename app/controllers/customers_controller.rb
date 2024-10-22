class CustomersController < ApplicationController
  def index
    if params[:search]
      @customers = Customer.where("lower(full_name) LIKE ?", "%#{params[:search].downcase}%")
    else
      @customers = Customer.all
    end
  end

  def alphabetized
    @customers = Customer.order(:full_name)
  end

  def missing_email
    @customers = Customer.where(email: nil)
  end
end
