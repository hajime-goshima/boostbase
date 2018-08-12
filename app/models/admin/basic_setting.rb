class Admin::BasicSetting < ApplicationRecord
  validates :title, presence: true
end
