class Contact < ApplicationRecord
  belongs_to :user
  has_many :contact_groups
  has_many :groups, through: :contact_groups
  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: true

  def updated_at_time
    updated_at.strftime("%b %d, %Y")
  end

  def full_name
    "#{first_name} #{middle_name} #{last_name}"
  end

end
