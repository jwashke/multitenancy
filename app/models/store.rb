class Store < ActiveRecord::Base
  before_create :generate_slug

  has_many :items

  def generate_slug
    self.slug = self.name.parameterize
  end
end
