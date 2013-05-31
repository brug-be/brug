class Participants < ActiveRecord::Base
  belongs_to :member
  belongs_to :gathering
end
