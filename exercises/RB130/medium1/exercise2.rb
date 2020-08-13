class TextAnalyzer
  def process(file_name)
    file = File.open(file_name, 'r')
    yield(file)
    file.close
  end
end

analyzer = TextAnalyzer.new

analyzer.process("text.txt") { |text| puts "#{text.readlines.size} lines" }

analyzer.process("text.txt") do |file|
  puts "#{file.read.split("\n\n").count} paragraphs"
end

analyzer.process("text.txt") do |file|
  puts "#{file.read.split(" ").count} words"
end

# sample output:
# 3 paragraphs
# 15 lines
# 126 words
