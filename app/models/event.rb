class Event < ApplicationRecord
  belongs_to :harvest
  belongs_to :user
end
