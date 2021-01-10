class Pair < ApplicationRecord
  belongs_to :market
  belongs_to :base, class: "Asset"
  belongs_to :quote, class: "Asset"
end

# == Schema Information
#
# Table name: pairs
#
#  id         :bigint           not null, primary key
#  name       :string
#  slug       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  base_id    :integer          not null
#  market_id  :bigint           not null
#  quote_id   :integer          not null
#
# Indexes
#
#  index_pairs_on_market_id  (market_id)
#
# Foreign Keys
#
#  fk_rails_...  (market_id => markets.id)
#
