class Payload < ApplicationRecord
  validates :label, uniqueness: true, allow_nil: true
end
