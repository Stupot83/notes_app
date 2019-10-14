class NoteList
  attr_reader :list

  def initialize
    @list = []
  end

  def add(item)
    @list.push(item.text)
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
