class Market < ApplicationRecord
  has_many :pairs
end

# == Schema Information
#
# Table name: markets
#
#  id         :bigint           not null, primary key
#  name       :string
#  slug       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
