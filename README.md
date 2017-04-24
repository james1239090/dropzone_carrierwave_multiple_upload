# README

This project is an example that integrated nested form, carrierwave, mini_magick, and dropzon.js.

User can upload, edit, delete, and show multiple images.

* Ruby version :  2.3.0

* Gem require :
  - [carrierwave > 1.0](https://github.com/carrierwaveuploader/carrierwave)
  - [dropzonejs-rails](https://github.com/ncuesta/dropzonejs-rails)
  - [mini_magick](https://github.com/minimagick/minimagick)
* Database
  - sqlite3
  - If you want to use other database
    - [check here first](https://github.com/carrierwaveuploader/carrierwave#user-content-multiple-file-uploads)
    - **remove** `serialize :images, JSON` on `model/photo.rb`

![alt tag](http://www.giphy.com/gifs/3o7buhrx0bZ8UZEgnu)
