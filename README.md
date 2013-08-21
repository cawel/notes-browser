# Notes Browser

## Introduction

I usually take notes in plain text files using the [Markdown](http://daringfireball.net/projects/markdown/) syntax. I wanted to read them in a HTML browser – hence leveraging CSS styling – so I created this simple browse tool.

The latest version of this app (so that you get the idea) [is live on heroku](http://notes-browser.herokuapp.com/).


## How to use it

There are 2 ways you can source your notes files to the app. The configuration (choosing the way you prefer) is done in the `Service::FileService` class (for now).

### Local File System

1. Dump your notes files in the "public/notes/" directory of this project. Alternatively you can symlink "public/notes/" to your own notes files folder.

2. Install the app with:
``` 
bundle install
``` 

3. Start Rails server with:
``` 
rails server
``` 

4. Browse your notes through the web at http://localhost:3000

### Dropbox

1. Create a Dropbox App (in order to create a dropbox folder in which you can toss your notes files in)

2. Define 3 env vars in your shell (or on heroku):
```
export DROPBOX_APP_KEY='your-app-key'
export DROPBOX_APP_SECRET='app-key'
export DROPBOX_ACCESS_TOKEN='access-token'
```

3. Install the app with:
``` 
bundle install
``` 
4. Start Rails server with:
``` 
rails server
``` 
5. Browse your notes through the web at http://localhost:3000


## Dependencies versions

As specified in the Gemfile:
* ruby 2.0
* Rails v3.2.14
