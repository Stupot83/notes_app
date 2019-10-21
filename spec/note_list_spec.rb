require "note_list"
require "note"

describe "NoteList" do
  let(:note_list) { NoteList.new }
  let(:note_1) { double(:note, title: "Note1", body: "Dave is great") }
  let(:note_2) { double(:note, title: "Note2", body: "Bob is awesome") }

  it "should create an instance of the NoteList class" do
    expect(note_list).to be_instance_of(NoteList)
  end

  context "#add" do
    subject { note_list }

    it { is_expected.to respond_to(:add) }

    it { is_expected.to respond_to(:add).with(1).argument }

    it "should allow a Note to be added to the NoteList" do
      allow(note_1).to receive(:text).and_return("Note1")
      allow(note_2).to receive(:text).and_return("Note2")
      note_list.add(note_1)
      note_list.add(note_2)
      expect(note_list.list).to include("Note1", "Note2")
    end
  end

  context "#print" do
    subject { note_list }

    it { is_expected.to respond_to(:print) }

    it "should allow the user to print the list of Notes" do
      allow(note_1).to receive(:text).and_return("Note1")
      note_list.add(note_1)
      expect do note_list.print end.to output("* Note1\n").to_stdout
    end
  end

  context "#find_note" do
    subject { note_list }

    it { is_expected.to respond_to(:find_note) }

    it { is_expected.to respond_to(:find_note).with(1).argument }

    it "should allow the user to select a note by title and view its content" do
      allow(note_1).to receive(:text).and_return("Note1")
      note_list.add(note_1)

      actual = note_list.find_note("Note1")

      expected = "Note1"

      expect(actual).to eq(expected)
    end
  end

  context "#remove_note" do
    subject { note_list }

    it { is_expected.to respond_to(:remove_note) }

    it { is_expected.to respond_to(:remove_note).with(1).argument }

    it "should allow the user to remove a note" do
      allow(note_1).to receive(:text).and_return("Note1")
      note_list.add(note_1)

      actual = note_list.remove_note("Note1")

      expected = "Note1"

      expect(actual).not_to include(expected)
    end
  end

  context "#format" do
    subject { note_list }

    it { is_expected.to respond_to(:format) }

    it { is_expected.to respond_to(:format).with(1).argument }

    it "should allow the user to view a formatted version of the note" do
      allow(note_1).to receive(:text).and_return("Note1")
      note_list.add(note_1)

      actual = note_list.format(note_1)

      expected = "Title: Note1\nDave is great"

      expect(actual).to eq(expected)
    end
  end
end
