# Create a new Heroku app
resource "heroku_app" "default" {
    # max length size: 30 chars
    name = "${var.username}-myapp-hrk-${var.heroku_environment}"
    region = "${var.heroku_region}"

    config_vars {
        FOOBAR = "baz"
    }
}

# Create a database, and configure the app to use it
resource "heroku_addon" "database_default" {
  app = "${heroku_app.default.name}"
  plan = "heroku-redis:hobby-dev"
}

# Associate logentries addon
resource "heroku_addon" "logging_default" {
    app = "${heroku_app.default.name}"
    plan = "logentries:le_tryit"
}

# Associate a custom domain
resource "heroku_domain" "domain_default" {
    app = "${heroku_app.default.name}"
    hostname = "${heroku_app.default.name}.examplecorp.es"
}
