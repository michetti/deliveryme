class Restaurant < ActiveRecord::Base
  has_many :products, dependent: :destroy

  # add multi tenancy support
  acts_as_tenant

  # tags will be used to categorize restaurants
  acts_as_taggable

  def to_s
    name
  end
end
