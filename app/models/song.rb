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

  def notes=(notes)
    notes.each do |note|
      note=Note.find_or_create_by(content:note)
      self.notes<<note
      note.song_id=self.id
    end
  end
end
