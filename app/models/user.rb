class User < ApplicationRecord
  has_many :prototypes, dependent: :destroy
  has_many :comments, dependent: :destroy # Userモデルにcommentsとの関連付けを追加

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :profile, presence: true
  validates :occupation, presence: true
  validates :position, presence: true
end
