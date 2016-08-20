class Page < ActiveRecord::Base
  mount_uploader :image, PageImageUploader # mount_uploader カラム名, アップローダー名
end
