class ApiVersionConstraint
  attr_reader :version

  def initialize(options)
    @version = options.fetch(:version)
  end

  def matches?(request)
    request
      .headers
      .fetch(:accept)
      .include?("application/vnd.fenix.v#{@version}+json")
  end
end
