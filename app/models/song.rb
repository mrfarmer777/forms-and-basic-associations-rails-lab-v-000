class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist=Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def genre_id=(id)
    self.genre=Genre.find(id)
  end

  def genre_id
    self.genre ? self.genre.id : nil
  end

  def notes=(note_strings)
    note_strings.each do |note_string|
      self.notes.build(note_string)
    end
  end
end
