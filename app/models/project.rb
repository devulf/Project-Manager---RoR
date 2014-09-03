class Project < ActiveRecord::Base


  has_and_belongs_to_many :users
  has_many :tickets, :dependent => :destroy

  attr_accessible  :name, :description, :start_date, :end_date, :user_ids

   validates :name,
   :presence => {:message => "You need to specify a name"},
    :length => {:minimum => 6, :maximum => 50, :message => "A project has to have atleast 6 characters, max 50"}

     validates :description,
   :presence => {:message => "You need to specify a description"},
    :length => {:minimum => 6, :maximum => 50, :message => "A description has to have atleast 6 characters, max 50"}

      validate :end_date_cannot_be_less_then_start_date

private



def self.search(search)
  if search
    find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
  else
    find(:all)
  end
end



def end_date_cannot_be_less_then_start_date
errors.add(:end_date, "can't be less than the start date") if
      !end_date.blank? and end_date < start_date
end

end
