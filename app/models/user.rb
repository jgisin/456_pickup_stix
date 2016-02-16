class User < ActiveRecord::Base
  has_secure_password

  validates :password,
            :length => {:in => 4..24},
            :allow_nil => true

  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :email, :presence => true

  #User initiating friendship
  has_many :initiated_followings, foreign_key: :followed_id,
           class_name: "Following"

  has_many :followeds, :through => :initiated_followings,
           :source => :followed

  #User recieving friendship
  has_many :recieved_followings, foreign_key: :follower_id,
           class_name: "Following"

  has_many :followers, :through => :recieved_followings,
           :source => :follower

  has_many :playlists, :dependent => :destroy
  has_many :bookmarks, :dependent => :destroy


  def generate_token
    begin
      self[:auth_token] = SecureRandom.urlsafe_base64
    end while User.exists?(:auth_token => self[:auth_token])
  end

  def regenerate_auth_token
    self.auth_token = nil
    generate_token
    save!
  end
end
