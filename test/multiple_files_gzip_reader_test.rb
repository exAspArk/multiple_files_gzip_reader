require "multiple_files_gzip_reader"
require "minitest/autorun"

class MultipleFilesGzipReaderTest < Minitest::Test
  def test_each_line
    reader = MultipleFilesGzipReader.new(File.open("test/fixtures/test.json.gz"))
    lines = []

    reader.each_line { |line| lines << line }

    assert lines, ["foo", "bar"]
  end
end
