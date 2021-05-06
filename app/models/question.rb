class Question < ApplicationRecord
  belongs_to :user
  has_one_attached:image
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 300 }
  validates :title, presence: true, length: { maximum: 50 }
  validates :image,   content_type: { in: %w[image/jpeg image/gif image/png],
                                      message: "画像フォーマットが不適切です" },
                      size:         { less_than: 5.megabytes,
                                      message: "画像サイズは5MB以下である必要があります" }
                                      
  def self.search(search)
    return Question.all unless search
    Question.where(['title LIKE ?', "%#{search}%"])
  end
end
