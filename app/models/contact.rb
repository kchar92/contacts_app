class Contact < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  belongs_to :user
  has_many :contact_groups
  has_many :groups, through: :contact_groups

  def friendly_updated_at
    updated_at.strftime("%A, %b %d")
  end
  
  def full_name
    "#{first_name} #{middle_name} #{last_name}"
  end
end
