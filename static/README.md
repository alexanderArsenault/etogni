## Usage
Download to target directory or use this repository as a template
```sh
$ curl -L -o master.zip https://github.com/cvgellhorn/webpack-boilerplate/archive/master.zip && unzip master.zip && rm master.zip && mv ./webpack-boilerplate-master/{.,}* ./ && rm -r ./webpack-boilerplate-master
```

## Setup
Install dependencies
```sh
$ npm install
```

## Development
Build the app in dev mode and run webpack serve with livereload and autocompile on [http://0.0.0.0:8080/](http://0.0.0.0:8080/)
```sh
$ npm run dev
```
## Production
Build the app in production mode
```sh
$ npm run build
