require "note"

describe Note do
  before :each do
    @note = Note.new("Title", "Body")
  end

  it "successfully instantiates the Note class" do
    expect(@note).to be_kind_of(Note)
  end

  it "should have a title" do
    expect(@note.title).to eq("Title")
  end

  it "should have a body" do
    expect(@note.body).to eq("Body")
  end
end
