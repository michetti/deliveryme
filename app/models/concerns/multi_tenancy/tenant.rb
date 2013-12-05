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

  def self.tenant_class
    Rails.application.config.tenant_class
  end

  def self.tenant_column
    Rails.application.config.tenant_column
  end

  def self.current_id=(id)
    Thread.current[Rails.application.config.tenant_column] = id
  end

  def self.current_id
    Thread.current[Rails.application.config.tenant_column]
  end

  def self.current
    self.tenant_class.find_by_id(self.current_id)    
  end

  def self.find_by_id(id)
    self.tenant_class.find_by_id(id)
  end

  def self.find_by_id!(id)
    self.tenant_class.find_by_id(id)
  end

  def self.find_by_domain(domain)
    self.tenant_class.find_by_domain(domain)
  end

  def self.find_by_domain!(domain)
    self.tenant_class.find_by_domain!(domain)
  end

  def self.find_by_subdomain!(subdomain)
    self.tenant_class.find_by_subdomain!(subdomain)
  end

  def self.current_user_tenant_id
    current_user.present? ? current_user.send(self.tenant_column) : nil
  end

end
