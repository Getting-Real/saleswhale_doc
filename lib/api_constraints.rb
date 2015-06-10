class ApiConstraints
  def initialize(options)
    @version = options[:version]
    @default = options[:default]
  end

  # A constraint class must implement this method
  # In this case map any api call (with namespace api) to default api version - base on default params
  # unless request contain 'Accept' header that points to a particular API
  def matches?(req)
    @default || req.headers['Accept'].include?("application/vnd.saleswhale.v#{@version}")
  end
end
