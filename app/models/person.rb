class Person < ActiveRecord::Base
  attr_accessible :content, :image, :name, :title, :role, :enabled, :display_order

  mount_uploader :image, PersonImageUploader

  def self.staff
    self.where(:role => 1).where(:enabled => true).order("display_order asc")
  end

  def self.lay_elders
    self.where(:role => 2).where(:enabled => true).order("display_order asc")
  end
  
  def is_staff?
    if self.role == 1
      true
    else
      false
    end
  end

  def is_lay_elder?
    if self.role == 2
      true
    else
      false
    end
  end

  def role_text
    if self.role == 1
      "Staff"
    elsif self.role == 2
      "Lay Elder"
    end
  end

end
