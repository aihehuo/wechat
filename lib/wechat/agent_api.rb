# frozen_string_literal: true

require 'wechat/api_base'
require 'wechat/http_client'
require 'wechat/token/agent_access_token'
require 'wechat/ticket/agent_jsapi_ticket'

module Wechat
  class AgentApi < ApiBase
    attr_reader :agentid

    def initialize(appid, secret, token_file, agentid, timeout, skip_verify_ssl, jsapi_ticket_file)
      super()
      @client = HttpClient.new(QYAPI_BASE, timeout, skip_verify_ssl)
      @access_token = Token::AgentAccessToken.new(@client, appid, secret, token_file)
      @agentid = agentid
      @jsapi_ticket = Ticket::AgentJsapiTicket.new(@client, @access_token, jsapi_ticket_file)
      @qcloud = nil
    end
  end
end
