require "zlib"
require "multiple_files_gzip_reader/version"

class MultipleFilesGzipReader < Zlib::GzipReader
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

  def readlines
    map(&:to_s)
  end

  def read
    readlines.join
  end

private

  def io
    @io
  end

  def options
    @options
  end
end
