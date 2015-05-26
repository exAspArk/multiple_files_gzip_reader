require "minitest/autorun"
require "multiple_files_gzip_reader"
require "pry"

class MultipleFilesGzipReaderTest < Minitest::Test
  def test_each_line
    reader = MultipleFilesGzipReader.new(File.open("test/fixtures/test.json.gz"))
    lines = []

    reader.each_line { |line| lines << line }

    assert_equal lines, ["foo\n", "bar\n"]
  end

  def test_readlines
    reader = MultipleFilesGzipReader.new(File.open("test/fixtures/test.json.gz"))

    assert_equal reader.readlines, ["foo\n", "bar\n"]
  end

  def test_count
    reader = MultipleFilesGzipReader.new(File.open("test/fixtures/test.json.gz"))

    assert_equal reader.count, 2
  end

  def test_read
    reader = MultipleFilesGzipReader.new(File.open("test/fixtures/test.json.gz"))

    assert_equal reader.read, "foo\nbar\n"
  end
end
