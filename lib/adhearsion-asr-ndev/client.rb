# encoding: utf-8
require 'uri'
require 'cgi'
require 'httpclient'

class AdhearsionASR::Ndev::Client
  include Celluloid

  BASE_URL = 'https://dictation.nuancemobility.net/NMDPAsrCmdServlet'

  def initialize(app_id, app_key)
    @app_id, @app_key = app_id, app_key
    @client = ::HTTPClient.new
  end

  def recognize(file, options = {})
    uri = URI.parse BASE_URL
    uri.path << "/dictation"
    headers = options.delete(:headers) || {}
    options = default_options.merge(options)
    headers = default_headers.merge(headers)

    query = []
    options.each_pair { |k,v| query << "#{CGI.escape k.to_s}=#{CGI.escape v.to_s}" }
    uri.query = query.join "&"

    data = File.read(file)

    result = @client.post uri.to_s, data, headers
    result.body.strip
  end

private

  def default_options
    # id is used for speaker-dependent acoustic model adaptation
    # Consider setting it to something unique for each caller
    # if you have a pool of callers that does not change over time.
    # See Nuance documentation for more information.
    {
      appId: @app_id,
      appKey: @app_key,
      id: 0
    }
  end

  def default_headers
    {
      'Content-Type' => 'audio/x-wav;codec=pcm;bit=16;rate=8000',
      'Language' => 'en_US',
      'Accept' => 'text/plain',
      'X-Dictation-NBestListSize' => 1
    }
  end

end

    
