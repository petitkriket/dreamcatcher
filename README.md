# dreamcatcher

Scrap classfields, save it and display it on a react dashboard
to update json file

## Install the app.

To create mm_immo_data.json .json file in /lib/assets/

```
$ ruby lib/tasks/mm_immo_scrap.rb
```

Then install app and create a postgresql database :

```
$ bundle install && rails db:create && rails db:migrate
```

## Demo

Start the app and access from port 3000

```
$ rails s
```

```
$ open -a "Google Chrome" http://localhost:3000
```

## UML

![
](https://i.imgur.com/RPNfXJn.png)
