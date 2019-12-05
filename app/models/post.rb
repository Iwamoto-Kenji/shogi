class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user

  def self.search(search)
    if search
      where(['name LIKE ?', "%#{search}%"]) #部分一致を表示
    else
      all #全て表示させる
    end
end

  with_options presence: true do
    validates :name
    validates :text
    validates :image
  end
end
