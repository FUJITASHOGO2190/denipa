class Post < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions

  with_options presence: true do
    validates :user_id
    validates :content
    validates :washing_frequency
    validates :wearing_years
    validates :brand_id
    validates :images, presence: { message: "を選択して下さい" }
  end

  validates :brand_id, numericality: { other_than: 0, message: 'を選択して下さい' }

  belongs_to :user
  has_many_attached :images
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  belongs_to :brand

end
