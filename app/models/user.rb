class User < ApplicationRecord
  has_many:questions, dependent: :destroy
  has_one_attached:image
  before_save { self.email = email.downcase }
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: true }
                    
  has_secure_password      
  validates :password, presence: true, length: { minimum: 6 },allow_nil:true
  #has_secure_passwordでは追加したバリデーションとは別にオブジェクト生成時に
  #存在性を検証するようになっているため、空のパスワード（nil）が新規ユーザー登録時に
  #有効になることはない。
  #validates :image,   content_type: { in: %w[image/jpeg image/gif image/png],
  #                                    message: "画像フォーマットが不適切です" },
  #                    size:         { less_than: 5.megabytes,message: "画像サイズは5MB以下である必要があります" }
  
  
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
