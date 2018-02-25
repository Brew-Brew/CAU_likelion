class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]
  has_many :posts
  belongs_to :team

  after_create :assign_default_role

  def assign_default_role
    self.add_role(:admin) if self.roles.blank?
  end

  def self.from_omniauth(access_token)
   data = access_token.info
   user = User.where(:email => data["email"]).first

   unless user
     password = Devise.friendly_token[0,20]
     user = User.create(name: data["name"], email: data["email"], team_id: 0,
       password: password, password_confirmation: password
     )
   end
   user
  end
end
