module Payable
    extend ActiveSupport::Concern
    def gateway
        @gateway ||= Braintree::Gateway.new(
            environment:  :sandbox,
            merchant_id: 'b49nfxcvnky4pf6w',
            public_key: '37n6bfbw866cy2zr',
            private_key: '01fd83d7c77015d152d311e3de2ffa73'
          )
    end
end