class App
  def call(env)
    [status, headers, body]
  end

  private

  def status
    200
  end

  def headers
    { "Content-Type" => "text/plain" }
  end

  def body
    ["Yay, your first web application! <3"]
  end
end
