module KoiSendle
  class Order < Object
    def cancel!
      cancel
      refresh!
    end

    def create_return(customer_reference: nil, delivery_instructions: nil)
      attributes = {customer_reference: customer_reference, delivery_instructions: delivery_instructions}
      resource.create_return(order_id, attributes)
    end

    def retrieve_return
      resource.retrieve_return(order_id)
    end

    def cancel
      resource.cancel(order_id)
    end

    def cancelled?
      state == "Cancelled"
    end

    def refresh!
      initialize(resource.refresh(self), resource)
    end

    def tracking_status
      resource.tracking_status(sendle_reference)
    end

    def tracking_last_updated
      resource.tracking_status_last_updated(sendle_reference)
    end

    def track
    end

    def tracking_events
      resource.track(sendle_reference)
    end
  end
end
