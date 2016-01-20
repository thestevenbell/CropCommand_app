class AddUserRefToLots < ActiveRecord::Migration
  def change
    add_reference :lots, :user, index: true, foreign_key: true
  end
end
