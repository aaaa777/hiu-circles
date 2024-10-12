class Apihub::Api::ApiController < ApplicationController
  include ApiHelper

  def response_ok(data: nil)
    { json: { status: 'ok', data: data }.compact, status: :ok }
  end

  def response_error(message: nil)
    { json: { status: 'error', message: message }.compact, status: :unprocessable_entity }
  end
end