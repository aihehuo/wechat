# frozen_string_literal: true

require 'wechat/token/access_token_base'

module Wechat
  module Token
    class AgentAccessToken < AccessTokenBase
      def refresh
        data = client.get('gettoken', params: { corpid: appid, corpsecret: secret })
        write_token_to_store(data)
        read_token_from_store
      end
    end
  end
end