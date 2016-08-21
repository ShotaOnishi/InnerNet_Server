class Tag < ActiveRecord::Base
  has_many :page_tags
  has_many :pages, :through => :page_tags
end
