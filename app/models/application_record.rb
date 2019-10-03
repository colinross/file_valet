require 'securerandom'

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  before_save do
    self.uuid ||= SecureRandom.uuid if attributes.include?("uuid")
  end

  def to_param
    attributes.include?("uuid") ? uuid : super
  end
end
