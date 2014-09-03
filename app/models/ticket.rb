class Ticket < ActiveRecord::Base
  belongs_to :user
  belongs_to :status
  belongs_to :project

   attr_accessible :name, :description, :status_id, :project_id

   validates :name,
   :presence => {:message => "You need to specify a name"},
    :length => {:minimum => 6, :maximum => 50, :message => "A ticket has to have atleast 6 characters, max 50"}

     validates :description,
   :presence => {:message => "You need to specify a description"},
    :length => {:minimum => 6, :maximum => 50, :message => "A description has to have atleast 6 characters, max 50"}
end
