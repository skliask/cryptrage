class TriangularJob < ApplicationJob
  queue_as :default

  def perform(*args)
    pairs = []
    Pair.includes([:base, :quote]).with_rate.each do |p|
      pairs << {
        id: p.id,
        base: p.base_id,
        quote: p.quote_id,
        rate: p.rate
      }
    end

    pairs.each do |pair_a|
      b_pairs = pairs.select { |bp| bp[:base] == pair_a[:base] }

      b_pairs.each do |pair_b|
        c_pairs = pairs.select { |cp| cp[:base] == pair_b[:quote] && cp[:quote] == pair_a[:base] }
        c_pairs.each do |pair_c|
          result = (pair_a[:rate] / pair_b[:rate]) * pair_c[:rate]
          if result > 1
            triangle = Triangle.includes([:pair_a, :pair_b, :pair_c]).where(
              pair_a_id: pair_a[:id],
              pair_b_id: pair_b[:id],
              pair_c_id: pair_c[:id]
            ).first_or_create

            triangle.rate = ((result - 1) * 100.0).round(2)
            triangle.save
          end
        end
      end
    end
  end
end
