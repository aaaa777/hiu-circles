class Apihub::Api::ApiController < ApplicationController
  protect_from_forgery

  # before_action :load_body

  # attr_reader :body

  protected

  def response_ok(data: nil)
    { json: { status: 'ok', data: data }.compact, status: :ok }
  end

  def response_error(message: nil)
    { json: { status: 'error', message: message }.compact, status: :unprocessable_entity }
  end

  # def body_params
  #   @body_params ||= ActionController::Parameters.new(body || {})
  # end

  # private

  # def load_body
  #   @body = request.body.read
  #   @body = JSON.parse(@body) if @body.present?
  # rescue JSON::ParserError
  #   @body = nil
  # end
end