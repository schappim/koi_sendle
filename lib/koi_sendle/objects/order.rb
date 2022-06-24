module KoiSendle
  class Order < Object
    
    # replace self with returned object
    
    def cancel!
      self.cancel
      self.refresh!
    end

    def create_return(customer_reference:nil, delivery_instructions:nil)
      attributes = {customer_reference: customer_reference, delivery_instructions: delivery_instructions}
      resource.create_return(self.order_id, attributes)
    end

    def retrieve_return
      resource.retrieve_return(self.order_id)
    end

    def cancel
      resource.cancel(self.order_id)
    end

    def cancelled? 
      self.state == 'Cancelled'
    end

    def refresh!
      self.initialize(resource.refresh(self), resource)
    end

    def tracking_status
      resource.tracking_status(self.sendle_reference)
    end

    def tracking_last_updated
      resource.tracking_status_last_updated(self.sendle_reference)
    end

    def track
    end

    def tracking_events
      resource.track(self.sendle_reference)
    end
    
  end
end