class Person < ActiveRecord::Base
  attr_accessible :content, :image, :name, :title, :role, :enabled, :display_order

  mount_uploader :image, PersonImageUploader
  
  def role_text
    if self.role == 1
      "Staff"
    elsif self.role == 2
      "Lay Elder"
    end
  end

end
