class Education < ApplicationRecord
  belongs_to :profile

  has_one_attached :image

  before_validation :smart_add_url_protocol

  validates :school, presence: true
  validates :degree, presence: true

  protected

  def smart_add_url_protocol
    unless self.school_url.empty?
      unless self.school_url[/\^http:\/\//] || self.school_url[/\^https:\/\//]
        self.school_url = "http://#{self.school_url}"
      end
    end
  end
end
