module MultiTenancy::Tenant
  extend ActiveSupport::Concern

  included do
    has_many :users, dependent: :destroy
    accepts_nested_attributes_for :users

    validates :name, :subdomain,
              presence: true, uniqueness: true

    validates :domain,
              uniqueness: true

    validates_associated :users
    validates_presence_of :users, on: :save
  end

  def to_s
    subdomain || domain
  end

  def self.current_id=(id)
    Thread.current[Rails.application.config.tenant_column] = id
  end

  def self.current_id
    Thread.current[Rails.application.config.tenant_column]
  end
end
