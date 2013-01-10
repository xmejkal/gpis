#exceptions
  class GpisError < StandardError; end

  class GpisParseError < GpisError; end
  class GpisPageNotFoundError < GpisError; end
  class GpisServiceNotAvailable < GpisError; end