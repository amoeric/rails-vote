module Payable
    extend ActiveSupport::Concern
    def gateway
        @gateway ||= Braintree::Gateway.new(
            environment:  :sandbox,
            merchant_id: ENV['merchant_id'],
            public_key: ENV['public_key'],
            private_key: ENV['private_key']
          )
    end
end