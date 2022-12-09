module RequestSpecHelper
  def response_body
    JSON.parse(last_response.body)
  end
end
