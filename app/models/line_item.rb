class LineItem < ApplicationRecord
  belongs_to :cart
  belongs_to :ticket
  belongs_to :order, optional: true

  def total_price
    quantity * ticket.price
  end
end
