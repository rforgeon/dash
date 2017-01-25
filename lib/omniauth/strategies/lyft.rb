require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Lyft < OmniAuth::Strategies::OAuth2

      # Give your strategy a name.
      option :name, "lyft"

      # This is where you pass the options you would pass when
      # initializing your consumer from the OAuth gem.
      option :client_options, {
        site: "https://api.lyft.com/v1",
        authorize_url: "https://api.lyft.com/oauth/authorize?response_type=code",
        token_url: 'https://api.lyft.com/oauth/token'
      }

      option :authorize_options, [:scope]

      option :token_params, :grant_type => 'authorization_code'

      # These are called after authentication has succeeded. If
      # possible, you should try to set the UID without making
      # additional calls (if the user id is returned with the token
      # or as a URI parameter). This may not be possible with all
      # providers.


      def raw_info
        @raw_info ||= access_token.get("#{options[:client_options][:site]}/profile").parsed
      end

      def build_access_token
        options.token_params.merge!(:code => request.params["code"], :headers => {'Authorization' => basic_auth_header })
        super
      end

      def basic_auth_header
        "Basic " + Base64.strict_encode64("#{options[:client_id]}:#{options[:client_secret]}")
      end

    end
  end
end
