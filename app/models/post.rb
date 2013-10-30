class Post < ActiveRecord::Base
  attr_accessible :title, :permalink

  validates :title, presence: true
  validates :permalink, uniqueness: true, format: { with: /\A[a-zA-Z0-9\_\-]{5,255}\z/ }, allow_nil: true

  def generate_permalink!
    if self.permalink.blank?
      permalink = self.title.parameterize
      permalink += "-#{Time.current.to_i.to_s + rand(10).to_i.to_s}" unless Post.find_by_permalink(permalink).blank?
      self.permalink = permalink
    end
  end
end
