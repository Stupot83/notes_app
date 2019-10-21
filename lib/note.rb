require_relative "note_list"

class Note
  attr_reader :title, :body

  def initialize(title, body)
    @title = title
    @body = body
  end

  def title
    @title
  end

  def body
    @body
  end

  def text
    return @title
  end
end
