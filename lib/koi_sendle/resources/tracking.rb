module KoiSendle
  class TrackingResource < Resource
    def events(ref)
      Tracking.new(get_request("tracking/#{ref}").body, self)
    end
  end
end
