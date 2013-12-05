class Theme < ActiveRecord::Base
  validates :name, :path,
            presence: true, uniqueness: true

  def to_s
    name
  end

  def find_parent
    Theme.find_by_path(parent)
  end
end
