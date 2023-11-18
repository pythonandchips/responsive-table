# frozen_string_literal: true

class OrderLinkComponent < ViewComponent::Base
  def initialize(attr, as: nil)
    super

    @attr = attr.to_s
    @as = as
  end

  attr_reader :attr, :as

  private

  def ordered_by_attr?
    params[:order] == attr
  end

  def order_direction(direction)
    return :asc if direction.blank? || !ordered_by_attr?

    if direction == "asc"
      :desc
    else
      :asc
    end
  end
end
