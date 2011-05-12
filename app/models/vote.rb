class Vote < ActiveRecord::Base
  belongs_to :user
  has_many :votings

  validates_presence_of :user_id, :title
end
