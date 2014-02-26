class User < ActiveRecord::Base
  # scope to current tenant
  scope_to_tenant

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :restaurant

  def to_s
    email
  end
end
