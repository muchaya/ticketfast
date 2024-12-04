module CurrencyHelper
  def format_rands(amount)
    number_to_currency(amount, locale: "en-ZA")
  end
end
