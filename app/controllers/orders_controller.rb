class OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.new(order_params.except(:amount, :item_name))

    if @order.save
      build_line_items
      pay
      clear_cart
      
      render json: { uuid: pay['uuid'], status: :ok }
    else
      render :new, alert: 'Could not create order. Please try again.'
    end
  end

  private

  def order_params
    params.require(:order).permit(:first_name, :last_name, :email, :amount, :item_name)
  end

  def pay
    payment = Payfast::Payment.create(
      merchant_id: Payfast.merchant_id,
      merchant_key: Payfast.merchant_key,
      amount: sprintf('%.2f', Current.cart.subtotal), 
      email: params[:email],
      first_name: params[:first_name],
      last_name: params[:last_name], 
      item_name: 'Tickets'
    )

    unless payment.success?
      flash[:alert] = 'Payment failed. Please try again.'
      redirect_to :new and return
    end

    payment
  end

  def build_line_items
    Current.cart.line_items.each do |line_item|
      @order.line_items << line_item
    end
  end

  def clear_cart
    Cart.destroy(session[:cart_id])
    session[:cart_id] = nil
  end
end
  