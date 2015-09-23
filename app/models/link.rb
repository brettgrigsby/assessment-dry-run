class Link < ActiveRecord::Base
  belongs_to :user
  validates :url, :format => URI::regexp(%w(http https))

  def toggle_read
    new_status = read ? false : true
    update_attributes(read: new_status)
  end
end
