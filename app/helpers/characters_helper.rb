module CharactersHelper
  def format_money m
    s = ((m / 100) % 100).round(0, half: :down)
    g = (m / 10000).round(0, half: :down)
    c = m % 100
    "%sg %02is %02ic" % [number_with_delimiter(g), s, c]
  end
end
