module Wonga
  module Daemon
    class PantryAdDomainLeftEventHandler
      def initialize(api_client, logger)
        @api_client = api_client
        @logger     = logger
      end

      def handle_message(message)
        @logger.info "Updating domain left status for Request:#{message['id']}, Name:#{message['instance_name']}, InstanceID:#{message['instance_id']}"
        message[:event] = :terminated
        message[:joined] = :false
        @api_client.send_put_request("/api/ec2_instances/#{message['id']}", message)
      end
    end
  end
end
