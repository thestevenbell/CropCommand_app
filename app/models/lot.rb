class Lot < ActiveRecord::Base
  belongs_to :user
  has_one :strain, :class_name => 'Strain', :foreign_key => 'strain_code'

  validates :lot_code, presence: true

  before_save :default_values

  def default_values
    self.active ||= false
    nil                           # required so that TX will not rollback!!!
  end
end

