class TrianglesController < ApplicationController
  def index
    @triangles = Triangle.where("rate < ?", 26).includes([:pair_a, :pair_b, :pair_c])
      .order(rate: :desc).page(params[:page]).per(20)
  end
end
