class Customer < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    [ "email", "full_name", "id", "notes", "phone" ]
  end
end

