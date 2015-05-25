require "multiple_files_gzip_reader/version"
require "zlib"

class MultipleFilesGzipReader
  include Enumerable

  def initialize(io, options = {})
    @io = io
    @options = options
  end

  def rewind
    io.pos = 0
  end

  def each(*args, &block)
    loop do
      gzip_reader = Zlib::GzipReader.new(io, options)

      gzip_reader.each_line(*args, &block)

      unused = gzip_reader.unused
      gzip_reader.finish

      io.pos -= unused ? unused.length : 0
      break if io.pos == io.size
    end
  end

  alias_method :each_line, :each

  def readlines(*args)
    result = []

    loop do
      gzip_reader = Zlib::GzipReader.new(io, options)

      result.concat gzip_reader.readlines(*args)

      unused = gzip_reader.unused
      gzip_reader.finish

      io.pos -= unused ? unused.length : 0
      break if io.pos == io.size
    end

    result
  end

private

  def io
    @io
  end

  def options
    @options
  end
end
