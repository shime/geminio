class ErrorMessage
  def initialize(string)
    @message = string.gsub(/^[ \t]{#{6}}/, '')
  end

  def to_s
    @message
  end
end
