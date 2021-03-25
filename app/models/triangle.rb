class Triangle < ApplicationRecord
  belongs_to :pair_a, class_name: "Pair"
  belongs_to :pair_b, class_name: "Pair"
  belongs_to :pair_c, class_name: "Pair"
end

# == Schema Information
#
# Table name: triangles
#
#  id         :bigint           not null, primary key
#  rate       :decimal(, )
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  pair_a_id  :bigint           not null
#  pair_b_id  :bigint           not null
#  pair_c_id  :bigint           not null
#
# Indexes
#
#  index_triangles_on_pair_a_id  (pair_a_id)
#  index_triangles_on_pair_b_id  (pair_b_id)
#  index_triangles_on_pair_c_id  (pair_c_id)
#
