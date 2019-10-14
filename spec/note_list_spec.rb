Dir["./lib/*.rb"].each { |file| require file }

describe "NoteList" do
  before :each do
    @note_list = NoteList.new
    @note = Note.new("Testing Note", "blah")
    @note_list.add(@note)
    @note2 = Note.new("Testing2 Note2", "blah, blah, blah")
    @note_list.add(@note2)
    @note3 = Note.new("Testing3 Note3", "blah, blah, blah, blah")
    @note_list.add(@note3)
  end

  it "should create an instance of the NoteList class" do
    expect(@note_list).to be_instance_of(NoteList)
  end

  it "should allow a Note to be added to the NoteList" do
    expect(@note_list.list).to include("Testing Note", "Testing2 Note2", "Testing3 Note3")
  end

  it "should allow the user to print the list of Notes" do
    expect do @note_list.print end.to output("* Testing Note\n* Testing2 Note2\n* Testing3 Note3\n").to_stdout
  end

  it "should allow the user to select a note by title and view its content" do
    actual = @note_list.find_note("Testing Note")

    expected = "Testing Note"

    expect(actual).to eq(expected)
  end

  it "should allow the user to select a note by title and view its content" do
    actual = @note_list.remove_note("Testing Note")

    expected = "Testing Note"

    expect(actual).not_to include(expected)
  end

  it "should allow the user to view a formatted version of the note" do
    actual = @note_list.format(@note2)

    expected = "Title: Testing2 Note2\nblah, blah, blah"

    expect(actual).to eq(expected)
  end
end
