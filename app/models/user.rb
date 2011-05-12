class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  belongs_to :role
  has_many :votes
  has_many :votings

  def name
    self.username.blank? ? self.email : self.username
  end

  def is_admin?
    self.role && self.role.name.to_s == 'Admin'
  end
end
