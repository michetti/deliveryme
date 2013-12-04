class User < ActiveRecord::Base
  include MultiTenancy::ScopeToTenant

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :restaurant

  def to_s
    email
  end
end
