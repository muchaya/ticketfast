class OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
  end

  def create
 

    @order = Order.new(order_params.except(:amount, :item_name))

    if @order.save

      build_line_items
      process_payment
      clear_cart
      
      render json: { uuid: payment.uuid }
    else
      render :new, alert: 'Could not create order. Please try again.'
    end
  end

  private

  def order_params
    params.require(:order).permit(:firstname, :surname, :email, :amount, :item_name)
  end

  def process_payment
    payment = Payfast::Payment.create(amount: @cart.sub_total, email: 'btmuchaya@gmail.com', item_name: 'Parvakit merchandise')

    unless payment.success?
      flash[:alert] = 'Payment failed. Please try again.'
      redirect_to :new and return
    end
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
  