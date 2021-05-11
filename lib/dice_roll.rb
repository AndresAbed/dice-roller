class DiceRoll
  attr_accessor :results

  def initialize params
    @sides = params[:sides].split(/[\s,',']/).reject(&:empty?).map(&:to_i)
    @results = []

    @sides.each do |sides|
      roll(sides)
    end

    @results.push({total: @results.inject(0) {|sum, hash| sum + hash[:result]}})
    @results.each {|element| element.each {|key, value| puts "#{key}:#{value}"} }
  end

  def roll sides
    value = (1..sides).to_a.shuffle.first

    data = {
      description: "#{sides}-sided die",
      result: value
    }

    @results.push(data)
  end
end
