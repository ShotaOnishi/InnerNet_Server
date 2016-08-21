class PageDomain < ActiveRecord::Base
  belongs_to :page
  belongs_to :domain
end
