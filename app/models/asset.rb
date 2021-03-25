class Asset < ApplicationRecord
  validates :slug, :ticker, presence: true
  validates :slug, :ticker, uniqueness: true
end

# == Schema Information
#
# Table name: assets
#
#  id         :bigint           not null, primary key
#  name       :string
#  slug       :string
#  ticker     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
