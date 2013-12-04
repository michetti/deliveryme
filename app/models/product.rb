class Product < ActiveRecord::Base
  include MultiTenancy::ScopeToTenant
  belongs_to :restaurant

  # tabs will be used to categorize products on menu
  acts_as_taggable

  # photo
  has_attached_file :photo, styles: { thumb: "128x128" }, default_url: "/images/:style/missing.png"

  validates :title, :description, :price,
            presence: true

  validates :title,
            uniqueness: true

  validates :price,
            numericality: {
              greater_than_or_equal_to: 0,
              less_than_or_equal_to: 100000000
            }

  def to_s
    title
  end
end
