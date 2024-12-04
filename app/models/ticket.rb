class Ticket < ApplicationRecord
  has_many :line_items

  def subtotal
    price * cart_quantity
  end

  def cart_quantity
    Current.cart.line_items.find_by(ticket_id: id)&.quantity || 0
  end
end
