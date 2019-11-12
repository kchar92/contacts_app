class Contact < ApplicationRecord
  def friendly_updated_at
    updated_at.strftime("%A, %b %d")
  end
end
