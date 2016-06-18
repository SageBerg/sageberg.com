class Tech < ActiveRecord::Base
  has_many :uses

  def self.box_days
    365
  end
end
