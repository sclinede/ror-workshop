class Student < ActiveRecord::Base
  has_many :participations, dependent: :destroy
  has_many :subject_items, through: :participations, dependent: :destroy
  has_many :subject_item_notes, dependent: :destroy

  validates :first_name, :last_name, presence: true
  validate :birthdate_validation

  accepts_nested_attributes_for :subject_items

  def non_validated_birthdate
    birthdate || birthdate_before_type_cast
  end

  private

  def birthdate_validation
    errors.add(:birthdate, :date_invalid) if !birthdate_before_type_cast.blank? && read_attribute(:birthdate).nil?
  end
end
