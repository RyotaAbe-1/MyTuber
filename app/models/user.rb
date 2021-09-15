class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :user_name, presence: true, length: { maximum: 22 }
  validates :introduce, length: { maximum: 200 }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]


  attachment :image
  
  has_many :sns_credentials, dependent: :destroy
  has_many :user_genres
  has_many :genres, through: :user_genres
  has_many :favorites
  has_many :youtubers
  has_many :comments
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followings, through: :active_relationships, source: :followed
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :follower
  
  def self.from_omniauth(auth)
    user = User.where(email: auth.info.email).first
    sns_credential_record = SnsCredential.where(provider: auth.provider, uid: auth.uid)
    if user.present?
      unless sns_credential_record.present?
        SnsCredential.create(
          user_id: user.id,
          provider: auth.provider,
          uid: auth.uid
        )
      end
    elsif
      user = User.new(
        id: User.all.last.id + 1,
        email: auth.info.email,
        password: Devise.friendly_token[0, 20],
        nickname: auth.info.name,
        last_name: auth.info.last_name,
        first_name: auth.info.first_name,
      )
      SnsCredential.new(
        provider: auth.provider,
        uid: auth.uid,
        user_id: user.id
      )
    end 
  user
  end
  
  def follow(user_id)
    active_relationships.create(followed_id: user_id)
  end

  def unfollow(user_id)
    active_relationships.find_by(followed_id: user_id).destroy
  end

  def following?(user)
    followings.include?(user)
  end

  def followed?(user)
    followers.include?(user)
  end

  def number_of_followings
    active_relationships.length
  end

  def number_of_followers
    passive_relationships.length
  end

  def self.search(keyword)
    where(["user_name like?", "%#{keyword}%"])
  end
end
