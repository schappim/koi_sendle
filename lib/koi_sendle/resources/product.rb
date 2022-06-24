module KoiSendle
  class ProductResource < Resource

    def get_products(sender_suburb:, sender_postcode:, sender_country:, receiver_suburb:, receiver_postcode:, receiver_country:,
      weight_value:, weight_units:)

      params = {
        sender_suburb: sender_suburb, 
        sender_postcode: sender_postcode, 
        sender_country: sender_country, 
        receiver_suburb: receiver_suburb, 
        receiver_postcode: receiver_postcode, 
        receiver_country: receiver_country, 
        weight_value: weight_value, 
        weight_units: weight_units, 
      }

      resp = get_request("products", params: params).body 
      
      products = []
      
      resp.each do |product|
        products << Product.new(product.dig("product"))
      end

      return products
    end

    def get_codes(sender_suburb:, sender_postcode:, sender_country:, receiver_suburb:, receiver_postcode:, receiver_country:,
      weight_value:, weight_units:)

      products = self.get_products(sender_suburb: sender_suburb, 
        sender_postcode: sender_postcode, 
        sender_country: sender_country, 
        receiver_suburb: receiver_suburb, 
        receiver_postcode: receiver_postcode, 
        receiver_country: receiver_country, 
        weight_value: weight_value, 
        weight_units: weight_units)

      products.map{|product| product.code}
    end


    alias :products :get_products
    alias :get :get_products
    alias :codes :get_codes

  end
end