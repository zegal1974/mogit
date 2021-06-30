require 'csv'

module CsvLoader
  DEFAULT_PATH = 'public/db/'

  def map_convert map, row, &block
    ret = {}
    map.each do |k, v|
      unless block_given?
        ret[k] = row[v]
      else
        ret[k] = yield row, v
      end
    end
    ret
  end

  def load_csv filename, path=nil
    path ||= DEFAULT_PATH
    csv_text = File.read(path + filename)
    csv = CSV.parse(csv_text, :headers => true)
  end
end