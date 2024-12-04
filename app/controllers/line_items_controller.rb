class LineItemsController < ApplicationController
  before_action :set_line_item, only: [:create, :destroy]

  def create
    @line_item.increment!(:quantity)

    if @line_item.save
      redirect_to ticket_path(@line_item.ticket)
    end
  end

  def destroy
    return if @line_item.quantity.zero?

    @line_item.decrement!(:quantity)

    redirect_to ticket_path(@line_item.ticket)
  end

  private

  def set_line_item
    @line_item = LineItem.find_or_create_by!(ticket_id: params[:ticket_id], cart_id: Current.cart.id)
  end
end
