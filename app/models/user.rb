class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]
  has_many :posts
  has_many :likes
  belongs_to :team

  after_create :assign_default_role

 #좋아요 관련 메소드
  def is_like? (post)
  Like.find_by(user_id: self.id, post_id: post.id).present?
  end
  #유저 기본권한 설정 관련 메소드
  def assign_default_role
    self.add_role(:admin) if self.roles.blank?
  end
 #구글 인증 관련 메소드
  def self.from_omniauth(access_token)
   data = access_token.info
   user = User.where(:email => data["email"]).first

   unless user
     password = Devise.friendly_token[0,20]
     user = User.create(name: data["name"], email: data["email"], team_id: 0, major: "학과",
       password: password, password_confirmation: password
     )
   end
   user
  end
end
