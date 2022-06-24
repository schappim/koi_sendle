module KoiSendle
  class PingResource < Resource
      
    def ping
        Ping.new get_request("ping").body
    end
  end
end