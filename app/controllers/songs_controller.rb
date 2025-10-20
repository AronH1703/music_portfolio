class SongsController < ApplicationController
  def show
    @song = params[:song]

    # Try DB first
    if defined?(Song)
      if (db_song = Song.find_by(slug: @song))
        @song_data = { title: db_song.title, links: db_song.links_hash }
        respond_to do |format|
          format.html { render :show }
          format.json { render json: @song_data }
        end
        return
      end
    end

    music_links = {
    "scream" => {
        title: "Scream - Aron Hannes ft. Diljá",
        links: {
          "Spotify" => "https://open.spotify.com/track/072Mb8aj53aafCvbLf3dUW?si=2c4fb122fd014c5b",
          "Apple Music" => "https://music.apple.com/is/album/scream-feat-dilj%C3%A1-single/1831948616",
          "Deezer" => "https://link.deezer.com/s/31lBS1XJD7oJFryTxBzF9",
          "Tidal" => "https://tidal.com/track/452642557",
          "Amazon Music" => "https://amazon.com/music/player/tracks/B0FLH4NK94?marketplaceId=ATVPDKIKX0DER&musicTerritory=US&ref=dm_sh_aheslWzTaMhrJuk7EPkSDQjO5",
        }
      },

    "little-me" => {
        title: "Little Me - Aron Hannes ft. Snny",
        links: {
          "Spotify" => "https://open.spotify.com/track/040XmcipGce3NYEKkJDgfa",
          "Apple Music" => "https://geo.music.apple.com/nl/album/_/1796929157?app=music&at=1000lHKX&ct=linktree_http&i=1796929287&itscg=30200&itsct=lt_m&ls=1&mt=1",
          "Deezer" => "https://www.deezer.com/track/476188905",
          "YouTube Music": "https://music.youtube.com/watch?v=FDUUrfMfkRQ",
          "Tidal" => "https://listen.tidal.com/album/418547352/track/418547353",
          "Amazon Music" => "https://music.amazon.com/albums/B0DXJCLX4R?trackAsin=B0DXJ9KBC4",
          "SoundCloud" => "https://soundcloud.com/aronhannes/little-me"
        }
      },
      "child" => {
        title: "Child - Aron Hannes",
        links: {
          "Spotify" => "https://open.spotify.com/track/4krgdvPJd5VaCqeVQ7pux3",
          "Apple Music" => "https://music.apple.com/us/album/child/1702521356?i=1702521361",
          "Deezer" => "https://www.deezer.com/track/476188905",
          "Tidal" => "https://tidal.com/browse/track/310739997",
          "Amazon Music" => "https://music.amazon.com/albums/B09KQ9QX4D",
          "YouTube Music": "https://music.youtube.com/watch?v=j5y1_QjBugA",
          "SoundCloud" => "https://soundcloud.com/aronhannes/child"
        }
      },
      "those-were-the-times" => {
        title: "Those Were The Times - INKT ft. Aron Hannes",
        links: {
          "Spotify" => "https://open.spotify.com/track/2vQwvuPDgsxyJyzsg8bKNG?si=f86bffca758347a2",
          "Apple Music" => "https://music.apple.com/us/album/those-were-the-times-single/1699380849",
          "Deezer" => "https://deezer.page.link/HTzVk7THkqZ98qBV9",
          "Tidal" => "https://tidal.com/browse/track/307289435",
          "Amazon Music" => "https://music.amazon.com/tracks/B0CCVR2SLY?marketplaceId=A3K6Y4MI8GDYMT&musicTerritory=NL&ref=dm_sh_x6K7RPbaKfzJU7Q57T9hxcVjI",
          "YouTube Music": "https://music.youtube.com/watch?v=UG0vUp9Dqqk&si=eaO7kentp2DGu94Z",
          "SoundCloud" => "https://soundcloud.com/inkt-music/those-were-the-times?utm_source=clipboard&utm_medium=text&utm_campaign=social_sharing"
        }
      },
      "twenties-album" => {
        title: "Twenties - Aron Hannes",
        links: {
          "Spotify" => "https://open.spotify.com/album/3udzLBW2ax27oLtvTEW2Ac?si=dHY1ua6GRcuEr6_c7fjONA",
          "Apple Music" => "https://music.apple.com/us/album/twenties-ep/1642285479",
          "Deezer" => "https://deezer.page.link/WTZ3432eWX3USLuW6",
          "Tidal" => "https://tidal.com/browse/album/245472703",
          "Amazon Music" => "https://music.amazon.com/albums/B0BC8L8G4R?marketplaceId=A3K6Y4MI8GDYMT&musicTerritory=NL&ref=dm_sh_kgctZjyJE4GqmR4HqRSt6XyJy",
          "YouTube Music": "https://music.youtube.com/playlist?list=OLAK5uy_kq_saUH9Tnxn7L2LqYSELwVqV4t45kCSM&si=QWhoT-v5oeuVhWfkA",
          "SoundCloud" => "https://soundcloud.com/aronhannes/sets/twenties-4"
        }
      }
      # Add more songs here as needed
    }

    # Normalize keys to strings
    @song_data = music_links[@song]
    @song_data[:links] = @song_data[:links].transform_keys(&:to_s) if @song_data

    respond_to do |format|
      format.html do
        if @song_data.nil?
          render plain: "Song not found", status: :not_found
        else
          render :show
        end
      end
      format.json do
        if @song_data.nil?
          render json: { error: 'Song not found' }, status: :not_found
        else
          render json: @song_data
        end
      end
    end
  end
end
