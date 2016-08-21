class Domain < ActiveRecord::Base
  has_many :page_domains
  has_many :pages, :through => :page_domains
end
