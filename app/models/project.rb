class Project < ApplicationRecord
  before_validation :smart_add_project_url_protocol, :smart_add_github_url_protocol
  belongs_to :profile

  # MODEL VALIDATIONS
  validates :title, presence: true, uniqueness: true
  validates :description, presence: true, uniqueness:true

  protected

  def smart_add_project_url_protocol
    unless self.project_url.empty?
      unless self.project_url[/\^http:\/\//] || self.project_url[/\^https:\/\//]
        self.project_url = "http://#{self.project_url}"
      end
    end
  end

  def smart_add_github_url_protocol
    unless self.github_url.empty?
      unless self.github_url[/\^http:\/\//] || self.github_url[/\^https:\/\//]
        self.github_url = "http://#{self.github_url}"
      end
    end
  end
end
