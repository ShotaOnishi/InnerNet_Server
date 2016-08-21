class Page < ActiveRecord::Base
  mount_uploader :image, PageImageUploader # mount_uploader カラム名, アップローダー名
  has_many :page_tags
  has_many :tags, :through => :page_tags
  has_many :page_domains
  has_many :domain, :through => :page_domains
  accepts_nested_attributes_for :tags #pageコントローラーのstrongパラメータの設定で, tags_attributesが使えるようになる.
  accepts_nested_attributes_for :domain
end
