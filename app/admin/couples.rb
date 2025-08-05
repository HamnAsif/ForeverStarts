ActiveAdmin.register Couple do
  actions :all, except: [:new, :edit] # Admin can only view and delete

  index do
    selectable_column
    id_column
    column :bride_name
    column :groom_name
    column("Email") { |couple| couple.user&.email }
    column :created_at
    actions
  end

  filter :bride_name
  filter :groom_name

  show do
    attributes_table do
      row :id
      row :bride_name
      row :groom_name
      row("Email") { |couple| couple.user&.email }
      row :created_at
      row :updated_at
    end
  end
end
