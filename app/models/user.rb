class User < ActiveRecord::Base
  has_many :links
  has_secure_password
  validates :email, presence: true, uniqueness: true


  def read_links
    links.where(read: true)
  end

  def unread_links
    links.where(read: false)
  end
end
