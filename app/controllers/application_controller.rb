# frozen_string_literal
class ApplicationController < ActionController::Base
  def redirect_back_with(fallback_location:, **options)
    params = options.delete(:params)
    if request.referer
      uri = URI.parse(request.referer)

      existing_params = URI.decode_www_form(uri.query || "")
      params.each do |key, value|
        existing_params << [key.to_s, value.to_s]
      end
      existing_params.sort_by! { |sub_array| sub_array[0] }
      uri.query = URI.encode_www_form(existing_params)

      redirect_to uri.to_s
    else
      redirect_to(fallback_location, **options)
    end
  end
end
