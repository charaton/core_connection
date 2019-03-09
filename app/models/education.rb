class Education < ApplicationRecord
  before_validation :smart_add_url_protocol
  belongs_to :profile

  validates :school, presence: true
  validates :degree, presence: true

  mount_uploader :image, EducationImageUploader

  protected

  def smart_add_url_protocol
    unless self.school_url.empty?
      unless self.school_url[/\^http:\/\//] || self.school_url[/\^https:\/\//]
        self.school_url = "http://#{self.school_url}"
      end
    end
  end

end
