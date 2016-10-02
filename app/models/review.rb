class Review < ApplicationRecord
	#ensures the presence of all of the elements stored in the database
  validates_presence_of :driver
  has_one :location
  belongs_to :driver

  def is_bad?
    self.bad_driver
  end
end
