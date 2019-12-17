class ApiPlatformConstraint
  attr_reader :platform

  def initialize(options)
    @platform = options.fetch(:platform)
  end

  def matches?(request)
    @platform.include?(request.headers.fetch('X-Platform'))
  end
end
