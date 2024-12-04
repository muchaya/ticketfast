class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy
  has_many :tickets, through: :line_items

  def subtotal
    sum = 0

    line_items.each do |line_item|
      sum += line_item.total_price
    end

    sum
  end

  def total_quantity
    quantity = 0

    line_items.each do |line_item|
      quantity += line_item.quantity
    end

    quantity
  end
end
