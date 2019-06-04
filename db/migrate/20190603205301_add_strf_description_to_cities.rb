class AddStrfDescriptionToCities < ActiveRecord::Migration[5.2]
  def change
    add_column :cities, :strf_description, :string
  end
end
