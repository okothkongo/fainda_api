class RemovePictureFromAdvertisements < ActiveRecord::Migration[5.2]
  def change
    remove_column :advertisements, :picture, :string
  end
end
