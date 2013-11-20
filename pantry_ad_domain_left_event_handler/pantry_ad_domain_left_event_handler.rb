module Wonga
  module Daemon
    class PantryAdDomainLeftEventHandler
      def initialize(api_client, logger)
        @api_client = api_client
        @logger     = logger
      end

      def handle_message(message)
        @logger.info "Updating domain left status for Request:#{message['pantry_request_id']}, Name:#{message['instance_name']}, InstanceID:#{message['instance_id']}"
        @api_client.update_ec2_instance(message['pantry_request_id'], { joined: false })
        @logger.info "Updating domain left status for Request:#{message['pantry_request_id']} succeeded"
      end
    end
  end
end
