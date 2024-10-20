class AddImageToCustomers < ActiveRecord::Migration[7.2]
  def change
    add_attachment :customers, :image
  end
end

