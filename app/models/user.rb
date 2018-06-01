class User < ApplicationRecord
  has_many :stations
  has_many :station_shows
  has_many :shows, through: :station_shows

  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true

  def self.stations_and_shows(uid)
    # current_user.
    # <% if current_user does not have the show %>
    # <% then populate the Add to My Station button%>
    # elseif the current_user does have the show
    # List the stations that it is associated with
    # And populate a button to move/add/delete to new station
    # So the move/add/delete form would have to look like
    # Listed in # of your stations:
    # - Station A
    # - Station B
    # - Station C
    # "Move/Add/Delete Button"
    # Clicking on this links to a form where all of the user's stations are populated
    # in checkbox fields. They can uncheck and check options, then click save, and the
    # form should update. 
    Show.includes(:station_shows).where(:station_shows => { fav: true, user_id: uid })
  end
end
