class Contact < ApplicationRecord

  def updated_at_time
    updated_at.strftime("%b %d, %Y")
  end

  def full_name
    "#{first_name} #{middle_name} #{last_name}"
  end

end
