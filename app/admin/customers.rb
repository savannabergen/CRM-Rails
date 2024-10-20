ActiveAdmin.register Customer do
  permit_params :full_name, :phone, :email, :notes, :image

  form do |f|
    f.inputs do
      f.input :full_name
      f.input :phone
      f.input :email
      f.input :notes
      f.input :image, as: :file
    end
    f.actions
  end

  show do
    attributes_table_for customer do
      row :image
    end
  end
end

