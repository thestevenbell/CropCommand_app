class Strain < ActiveRecord::Base
  belongs_to :user
  has_many :lots, :class_name => 'Lot', :foreign_key => 'lot_id'

  validates :strain_code, presence: true, uniqueness: true
  validates :source_original, presence: true
  validates :commercial_name, presence: true
  validates :common_name, presence: true
  validates :latin_name, presence: true
  validates :form_received, presence: true


  before_save :default_values

  private

  def default_values
    self.completed ||= false
    nil                           # required so that TX will not rollback!!!
  end
end





