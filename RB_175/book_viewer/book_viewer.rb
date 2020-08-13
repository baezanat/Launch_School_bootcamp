require "tilt/erubis"
require "sinatra"
require "sinatra/reloader" if development?

before do
  @contents = File.readlines('data/toc.txt')
end

get "/" do
  @title = 'The Adventures of Sherlock Holmes'
  erb :home
end

get "/chapters/:number" do
  num = params[:number].to_i
  redirect "/" unless (1..@contents.size).cover? num
  @title = @contents[num - 1]
  @chapter_num = "Chapter #{num}"
  @chapter = File.read("data/chp#{num}.txt")
  erb :chapter
end

get "/show/:name" do
  params[:name]
end

get "/search" do
  @results = chapters_matching(params[:query])
  erb :search
end

not_found do
  redirect "/"
end

helpers do
  def in_paragraphs(text)
    lines_arr = text.split("\n\n")
    lines_arr.map {|line| "<p>#{line}</p>" }.join("\n")
  end

  def each_chapter
    @contents.each_with_index do |name, index|
      number = index + 1
      contents = File.read("data/chp#{number}.txt")
      yield number, name, contents
    end
  end

  def in_paragraphs(text)
    text.split("\n\n").each_with_index.map do |line, index|
      "<p id=paragraph#{index}>#{line}</p>"
    end
  end

  def highlight(text, term)
    text.gsub(term, %(<strong>#{term}</strong>))
  end
end

def chapters_matching(query)
  results = []
  return results if !query || query.empty?
  each_chapter do |number, name, contents|
    results << {number: number, name: name, contents: contents, paragraphs: {}} if contents.include?(query)
  end
  results.each do |match|
    match[:contents].split("\n\n").each_with_index do |p, idx|
      match[:paragraphs][idx] = p if p.include?(query)
    end
  end
  results
end

