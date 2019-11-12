require 'twitter'

class OwnedTrend < ApplicationRecord
  belongs_to :user

end
