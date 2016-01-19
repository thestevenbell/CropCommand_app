class RemoveStrainIdFromStrains < ActiveRecord::Migration
  def change
    remove_column :strains, :strain_id, :string
  end
end
