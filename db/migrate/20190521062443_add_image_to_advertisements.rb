class AddImageToAdvertisements < ActiveRecord::Migration[5.2]
  def change
    add_column :advertisements, :image, :string 
  end
end
