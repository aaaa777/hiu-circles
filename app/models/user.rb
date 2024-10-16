class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :trackable

  has_many :members
  has_many :user_role_relations
  has_many :roles, through: :user_role_relations
  has_many :news_user_visibility_relations
  has_many :news, through: :user_role_relations

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]*do-johodai\.ac\.jp\z/i
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }#, message: "do-johodai.ac.jpで終わるメールアドレスを入力してください"
end
