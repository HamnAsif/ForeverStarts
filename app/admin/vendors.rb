ActiveAdmin.register Vendor do
  actions :all, except: [:new, :edit] # Admin can only view and delete

  index do
    selectable_column
    id_column
    column :username
    column :category
    column :contact
    column :location
    column("Email") { |vendor| vendor.user&.email }
    column :created_at
    actions
  end

  filter :username
  filter :category
  filter :contact
  filter :location

  show do
    attributes_table do
      row :id
      row :username
      row :category
      row :contact
      row :location
      row :description
      row("Email") { |vendor| vendor.user&.email }
      row :created_at
      row :updated_at
    end
  end
end
