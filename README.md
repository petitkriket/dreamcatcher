# Dreamcatcher

https://karacasa.herokuapp.com/classfields
Scrap classfields, save them and display results with SSR and some React components.
<b>Case study to build a HTML/XML scrapper.</b>

## Install the application

Install app and create a postgresql database with following commands :

```
$ bundle install && rails db:create && rails db:migrate
```

## Scrapping and automation

The fdollowing commands creates a json with the last 30 offers located (/lib/assets/mm_immo_data.json) and seed new results into DB

```
$ rake classfield:mm_scraper && rake db:seed
```

Task is automated via Heroku Automation add on, scrapping every 10 minutes and seeding hourly.

Whenever gem does it on a dev environment too but need some work ATM.

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
