# 1DV450-mh222zr-Registreringsapplikation
A simple API-key registration-app that lets users create an account/API-key. To be used in the future with an real API.

This app is tested on `Rails 4.0.1` and `Ruby 2.0.0p353`. Released under the [MIT license](LICENSE).

## Set up
1. Clone down the project.
2. Run `bundle install`
3. Run `db:migrate`
4. Run `rails s` to start the server.

**Note:** The first user that you create will get an admin role set. That allows him/her to delete other accounts/keys. **Don't delete this account if you haven't deleted all other accounts!**
