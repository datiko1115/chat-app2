class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user
  has_one_attached :image

  validates :content, presence: true, unless: :was_attached?

  #  was_attached? => true (imageあるとき)
  #   validates :content, presence:true がはたらかない
  #   つまり imageがあればcontentはあってもなくても良い

  #  was_attached? => false (imageないとき)
  #   validates :content, presence:true がはたらく
  #   つまり imageがなければcontentは必須

  def was_attached?
    self.image.attached?
  end
end
