class TrianglesController < ApplicationController
  def index
    @triangles = Triangle.where("rate < ?", 26).includes([:pair_a, :pair_b, :pair_c]).limit(100)
      .order(rate: :desc)
  end
end
