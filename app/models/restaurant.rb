class Restaurant < ActiveRecord::Base
  include MultiTenancy::Tenant
  has_many :products, dependent: :destroy

  # tags will be used to categorize restaurants
  acts_as_taggable

  def to_s
    name
  end
end
