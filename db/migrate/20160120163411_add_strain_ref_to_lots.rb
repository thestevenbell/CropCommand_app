class AddStrainRefToLots < ActiveRecord::Migration
  def change
    add_reference :lots, :strain, index: true, foreign_key: true
  end
end
