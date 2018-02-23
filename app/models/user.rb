class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts
  belongs_to :team

  after_create :assign_default_role

  def assign_default_role
    self.add_role(:admin) if self.roles.blank?
  end
end
