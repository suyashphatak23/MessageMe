# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "jquery", to: "https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js", preload: true
pin "semantic-ui-sass", to: "https://cdn.jsdelivr.net/npm/semantic-ui/dist/semantic.min.js", preload: true