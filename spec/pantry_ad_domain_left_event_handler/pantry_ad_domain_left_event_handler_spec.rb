require 'spec_helper'
require 'logger'
require_relative '../../pantry_ad_domain_left_event_handler/pantry_ad_domain_left_event_handler'

RSpec.describe Wonga::Daemon::PantryAdDomainLeftEventHandler do
  let(:config) do
    {
      'pantry' => {
        'api_key' => 'some_api_key',
        'request_timeout' => 10,
        'url' => 'http://some.url'
      }
    }
  end
  let(:logger) { instance_double(Logger).as_null_object }

  subject { Wonga::Daemon::PantryAdDomainLeftEventHandler.new(config, logger) }

  it_behaves_like 'handler'
end
