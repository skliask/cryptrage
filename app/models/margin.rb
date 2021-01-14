class Margin < ApplicationRecord
  belongs_to :base, class_name: "Pair"
  belongs_to :quote, class_name: "Pair"
end

# == Schema Information
#
# Table name: margins
#
#  id         :bigint           not null, primary key
#  decimal    :decimal(20, 10)  default(0.0), not null
#  margin     :decimal(20, 10)  default(0.0), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  base_id    :integer          not null
#  quote_id   :integer          not null
#
