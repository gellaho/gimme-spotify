class UsersController < ApplicationController
  def index
  end
  def spotify
    spotify_user = RSpotify::User.new(request.env['omniauth.auth'])

    song_json = song_list(spotify_user)
    File.write('songs.json', song_json.to_json)
    redirect_to root_path
  end

  private

  def song_list(spotify_user)
    song_json = []
    (0..5000).each_slice(50).with_index do |_, i|
      songs = spotify_user.saved_tracks(limit: 50, offset: i * 50)
      return song_json unless songs.present?
      song_json.concat(songs.map do |song|
        {
          artist: song.artists.map { |a| a.name }.join(','),
          title: song.name,
          album: song.album.name,
          release_date: song.album.release_date
        }
      end)
    end
    song_json
  end
end
