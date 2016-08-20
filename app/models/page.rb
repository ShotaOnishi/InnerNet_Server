class Page < ActiveRecord::Base
  mount_uploader :image, PageImageUploader # mount_uploader カラム名, アップローダー名
  has_many :page_tags
  has_many :tags, :through => :page_tags
end
