module KoiSendle
  class QuoteResource < Resource
    def get_quotes(product_code:, pickup_suburb:, pickup_postcode:, delivery_suburb:, delivery_country:, delivery_postcode:,
      weight_value:, weight_units:)

      params = {
        product_code: product_code,
        pickup_suburb: pickup_suburb,
        pickup_postcode: pickup_postcode,
        delivery_suburb: delivery_suburb,
        delivery_postcode: delivery_postcode,
        delivery_country: delivery_country,
        weight_value: weight_value,
        weight_units: weight_units
      }

      resp = get_request("quote", params: params).body

      quotes = []

      resp.each do |quote|
        quotes << Quote.new(quote.dig("quote"))
      end

      quotes
    end
  end
end
