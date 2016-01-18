class AddUserRefToStrains < ActiveRecord::Migration
  def change
    add_reference :strains, :user, index: true, foreign_key: true, null: false
  end
end
