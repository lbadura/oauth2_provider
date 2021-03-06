# Copyright (c) 2010 ThoughtWorks Inc. (http://thoughtworks.com)
# Licenced under the MIT License (http://www.opensource.org/licenses/mit-license.php)

module Oauth2
  module Provider
    module SslHelper

      def self.included(controller_class)
        controller_class.before_filter :mandatory_ssl unless ENV['DISABLE_OAUTH_SSL']
      end

      protected
      def mandatory_ssl
        if !request.ssl?
          if !ssl_enabled?
            error = 'This page can only be accessed using HTTPS.'
            flash.now[:error] = error
            render(:text => '', :layout => true, :status => :forbidden)
            return false
          else
            redirect_to 'https://' + request.host + ':' + ssl_port + request.request_uri
            return false
          end
        end
        true
      end

      private
      def ssl_enabled?
        # this is set from within tests!
        unless @ssl_enabled.nil?
          @ssl_enabled
        else
          !ssl_port.nil?
        end
      end

      def ssl_port
        ENV['OAUTH_SSL_PORT']
      end

    end
  end
end

