module KoiSendle
  class OrderResource < Resource
      
    def create(**attributes)
      Order.new(post_request("orders", body: attributes).body, self)
    end

    def create_return(order_id, attributes)
      Order.new(post_request("orders/#{order_id}/return", body: attributes).body, self)
    end

    def retrieve_return(order_id)
      Order.new(get_request("orders/#{order_id}/return").body, self)
    end

    def retrieve(order_id)
      Order.new(get_request("orders/#{order_id}").body, self)
    end

    def cancel(order_id)
      Order.new(delete_request("orders/#{order_id}").body, self)
    end
  
    def refresh(order)
      get_request("orders/#{order.order_id}", params: {}, headers: {}).body
    end

    def tracking_status(sendle_reference)
      get_request("tracking/#{sendle_reference}").body.dig("status").dig("description")
    end

    def tracking_status_last_updated(sendle_reference)
      DateTime.parse(get_request("tracking/#{sendle_reference}").body.dig("status").dig("last_changed_at"))
    end


    def track(sendle_reference)
      resp = get_request("tracking/#{sendle_reference}").body.dig("tracking_events")
      return resp.map{|e| Tracking.new(e, self)}
    end


  end
end