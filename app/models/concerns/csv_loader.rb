module CsvLoader
  DEFAULT_PATH = 'public/db/'

  def map_convert map, row
    ret = {}
    map.each do |k, v|
      ret[k] = row[v]
    end
    ret
  end

  def load_csv filename, path=nil
    path ||= DEFAULT_PATH
    csv_text = File.read(path + filename)
    csv = CSV.parse(csv_text, :headers => true)
  end
end