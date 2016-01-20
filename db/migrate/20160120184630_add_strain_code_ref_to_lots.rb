class AddStrainCodeRefToLots < ActiveRecord::Migration
  def change
    add_reference :lots, :strain_code
  end
end
