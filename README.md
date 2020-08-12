# README

## Purpose

This allows you to download a list of your saved songs in json format from Spotify.  
I don't expect this to be used by many people besides me.

The only reason this is a rails app is because OAuth is required.

## How to Begin

1) Clone the repository
2) Install correct ruby (2.6.6)
3) `gem install bundler`
4) `bundle`

### Other Prerequisites

You first need to add the credentials ([sign up here](https://developer.spotify.com/) and make an application) to your Rails secrets.  To do this, type the following:

```bash
rails credentials:edit
```

They should be added like so:

```yaml
spotify:
  client_id: 'whatever'
  client_secret: 'secret'
```

You'll also need to add the redirect url `http://localhost:3000/auth/spotify/callback` to your Spotify developer dashboard to make this work.

## Usage

```bash
bundle exec rails s
```

1) Go to [http://localhost:3000](http:://localhost:3000)
2) Click on sign in.
3) Authorize your account to your application
4) A file called `songs.json` will be generated in the root directory.
5) Behold the wonder of the json

```json
  {
    "artist": "Judas Priest",
    "title": "Screaming for Vengeance",
    "album": "Screaming For Vengeance",
    "release_date": "1982"
  },
  {
    "artist": "Judas Priest",
    "title": "Riding on the Wind",
    "album": "Screaming For Vengeance",
    "release_date": "1982"
  },
  {
    "artist": "Judas Priest",
    "title": "Electric Eye",
    "album": "Screaming For Vengeance",
    "release_date": "1982"
  }
```

## Note

This only gets up to the first 5000 saved tracks.  If you want more, change the 5000 in `app\controllers\users_controller.rb` to what you would like.

The data is also pretty minimal, so change that as well if you so desire.
