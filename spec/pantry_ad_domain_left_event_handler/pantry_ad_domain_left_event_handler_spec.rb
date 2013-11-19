require 'spec_helper'
require_relative '../../pantry_ad_domain_left_event_handler/pantry_ad_domain_left_event_handler'

describe Wonga::Daemon::PantryAdDomainLeftEventHandler do
  let(:config) {
    {
      "pantry" => {
        "api_key" => "some_api_key",
        "request_timeout" => 10,
        "url" => "http://some.url"
      }
    }
  }
  let(:logger) { instance_double('Logger').as_null_object }
  let(:api_client) { instance_double('ApiClient').as_null_object }

  subject { Wonga::Daemon::PantryAdDomainLeftEventHandler.new(api_client, logger) }

  it_behaves_like 'handler'
end