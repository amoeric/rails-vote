module Payable
    extend ActiveSupport::Concern
    def gateway
        @gateway ||= Braintree::Gateway.new(
            environment:  :sandbox,
            merchant_id: ENV['merchant_id'].to_sym,
            public_key: ENV['public_key'].to_sym,
            private_key: ENV['private_key'].to_sym
          )
    end
end