class Pair < ApplicationRecord
  belongs_to :base, class_name: "Asset"
  belongs_to :quote, class_name: "Asset"
  belongs_to :market

  scope :with_rate, -> { where.not(rate: 0) }
end

# == Schema Information
#
# Table name: pairs
#
#  id         :bigint           not null, primary key
#  name       :string
#  rate       :decimal(20, 10)  default(0.0), not null
#  slug       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  base_id    :integer          not null
#  market_id  :integer
#  quote_id   :integer          not null
#
