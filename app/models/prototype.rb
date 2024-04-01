class Prototype < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy # Prototypeモデルにcommentsとの関連付けを追加

  validates :title, presence: true
  validates :catch_copy, presence: true
  validates :concept, presence: true
  validates :image, presence: true


  has_one_attached :image
end
