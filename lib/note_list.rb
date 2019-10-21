require "note"

class NoteList
  attr_accessor :list

  def initialize
    @list = []
  end

  def add(note)
    @list.push(note.text)
  end

  def print
    @list.each do |x|
      puts "* #{x}\n"
    end
  end

  def find_note(title)
    @list.find { |note| note[title] == title }
  end

  def remove_note(title)
    @list.delete_if { |note| note[title] == title }
  end

  def format(note)
    "Title: #{note.title}\n#{note.body}"
  end
end
