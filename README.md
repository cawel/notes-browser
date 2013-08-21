# Notes Browser

## Introduction

I usually take notes in text files using the Markdown syntax. I wanted to read them in a HTML browser – benefitting from presentation CSS – so I created this simple tool to browse and display my note files. 

The latest version of this app (so that you get the idea) [is live on heroku](http://notes-browser.herokuapp.com/).


## How to use it

There are 2 ways you can source your notes files to the app. The configuration (choosing the way you prefer) is done in the `Service::FileService` class for now.

### Local File System

1. Dump your notes files in the "public/notes/" directory of this project. 
2. Install with:
``` 
bundle install
``` 
3. Start Rails server with:
``` 
rails server
``` 
4. Browse your notes through the web at http://localhost:3000

### Dropbox

1. Create a Dropbox App
2. Define 3 env vars in your shell:
```
export DROPBOX_APP_KEY='your-app-key'
export DROPBOX_APP_SECRET='app-key'
export DROPBOX_ACCESS_TOKEN='access-token'
```

3. Install with:
``` 
bundle install
``` 
4. Start Rails server with:
``` 
rails server
``` 
5. Browse your notes through the web at http://localhost:3000
