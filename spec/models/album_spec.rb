require 'rails_helper'

RSpec.describe Album, type: :model do
  describe "when normalizing artist" do
    it "strips whitespace" do
      album = Album.new(artist: "  10000 Maniacs   ")

      expect(album.artist).to eql "10000 Maniacs"
    end

    describe "when the artist starts with 'The'" do
      it "Moves 'The' to the end of the name with parenthisis" do
        album = Album.new(artist: "The Beatles")

        expect(album.artist).to eql "Beatles (The)"
      end
    end

    describe "when the artist starts with 'the'" do
      it "Moves 'The' to the end of the name with parenthisis" do
        album = Album.new(artist: "the Beatles")

        expect(album.artist).to eql "Beatles (The)"
      end
    end

    describe "when the artist name is not titlized" do
      it "Moves 'The' to the end of the name with parenthisis" do
        album = Album.new(artist: "the manic street preachers")

        expect(album.artist).to eql "Manic Street Preachers (The)"
      end
    end

    describe "when the artist starts with 'A'" do
      it "Moves 'A' to the end of the name with parenthisis" do
        album = Album.new(artist: "A tribe called Quest")

        expect(album.artist).to eql "Tribe Called Quest (A)"
      end
    end
  end
end
