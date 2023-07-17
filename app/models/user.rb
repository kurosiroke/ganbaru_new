class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        
  has_many :attempts, dependent: :destroy #取り組みの設定　削除されたら削除
  has_many :speeches, dependent: :destroy #コメントの設定。削除されたら削除
  has_many :favorites, dependent: :destroy #お気に入り　削除されたら
  
  validates :name, presence: true, uniqueness: true, length: { maximum: 10 }
   
  def active_for_authentication? #退会
    super && (is_deleted == false)
  end
  
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now
      user.name = "ゲスト"
      # name を入力必須のため "ゲスト" と表示
    end
  end
  
  def self.looks(search, word)
    if search == "perfect_match"
      @user = User.where("name LIKE?", "#{word}")
    elsif search == "forward_match"
      @user = User.where("name LIKE?","#{word}%")
    elsif search == "backward_match"
      @user = User.where("name LIKE?","%#{word}")
    elsif search == "partial_match"
      @user = User.where("name LIKE?","%#{word}%")
    else
      @user = User.all
    end
  end
end
