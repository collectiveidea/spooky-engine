module Spooky
  class WebhooksController < ActionController::API
    before_action :verify_signature

    def create
      ActiveSupport::Notifications.instrument("webhook.spooky", payload: request.raw_post) {}
      head :ok
    end

    private

    def verify_signature
      raise "Missing GHOST_WEBHOOK_SECRET" unless ENV["GHOST_WEBHOOK_SECRET"].present?
      signature = request.headers["x-ghost-signature"].match(/sha256=(?<sha>[a-z0-9]+), t=(?<t>\d+)/)

      expected_signature = OpenSSL::HMAC.hexdigest(
        "sha256",
        ENV["GHOST_WEBHOOK_SECRET"],
        request.raw_post.to_s + signature["t"] # Append timestamp from the header to the body.
      )
      raise "Invalid Signature" unless ActiveSupport::SecurityUtils.secure_compare(expected_signature, signature["sha"])
    end
  end
end
