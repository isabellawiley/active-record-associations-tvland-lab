class Actor < ActiveRecord::Base
  has_many :characters
  has_many :shows, through: :characters

  def full_name
    fname = self.first_name
    lname = self.last_name
    fname + " " + lname
  end

  def list_roles
    # Show.all.map {|show| show.actor == self}
    self.shows.map {|show| show.characters.find_by(:actor => self).name + " - " + show.name}
  end
end