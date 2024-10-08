# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
# pin "admin-lte", to: "https://cdn.jsdelivr.net/npm/admin-lte@4.0.0-beta2/dist/js/adminlte.min.js"
pin_all_from "app/javascript/controllers", under: "controllers"
# pin "scaffold-theme/main", to: "scaffold-theme/main.js"
# pin "scaffold-theme/validate", to: "scaffold-theme/validate.js"
