class Post < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions

  with_options presence: true do
    validates :user_id
    validates :content
    validates :washing_frequency
    validates :wearing_years
    validates :brand_id
    validates :image
  end

  validates :brand_id, numericality: { other_than: 0 }

  belongs_to :user
  has_one_attached :image

  belongs_to :brand

end
