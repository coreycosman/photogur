class Picture < ApplicationRecord

validates :artist, :title, :url, presence: true

  def self.month_old(time)  Picture.where("created_at < ?", time)
  end


end
