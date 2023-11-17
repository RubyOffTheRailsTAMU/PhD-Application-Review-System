# PhD-Application-Review-System

Organization:	Department of Computer Science and Engineering
Contact name:	Prof. Khanh Nguyen
Contact email:	khanhtn@tamu.edu

**Client's description of the project**
The PhD Admission process currently solicits reviews from committee members and faculties using a Google Sheet. PARC would like to have a system built that can help with the admission process.

1. it should help faculties easily filter applications of interest.
2. it should make the reviews input easy for faculties.
3. it should help support staff keep track of status of each application.

   
**Additional information provided by the client**
Green-light from the department head might be required before the work can start.

Ideally we would want to use TAMU credentials (one less account for faculties and staff to create) for users. Can it interact with webadmit API Links to an external site.? 

Note from Prof. Ritchey: consider it green-lighted, but see my advice below.

**Advice from Prof. Ritchey**
1. Use Ruby on Rails.
2. Focus on Functionality.
  a. Data security is critical due to FERPA.
    i. Keep all PII encrypted at rest, or don't store it at all if you don't need it.
    ii. Default = deny access.  Use whitelists to allow users access.
  b. Talk to several different faculty members about their experiences with the existing PhD application review system.
  c. Use OAuth2.0 to provide "Login with Google"
    i. use whitelisting to limit user access, e.g. must be a CSE faculty member to review PhD applications
  d. Make integration with WebAdMIT API a priority.
3. Adhere to BDD and TDD.

## Instruction for set-up and deploy

Follow this file, get started on Phd-Application-Review-System.

## Prerequisite

### Development Environment

Recommend to use `Sonoma 14.0` or `Ubuntu 22.04.3 LTS` from WSL2. (Refer to this [link](https://learn.microsoft.com/en-us/windows/wsl/install))

### Install ruby 3.2.2

Here I recommand to use rvm, it is a tool for manage ruby with different version. (Refer to this [link](https://rvm.io/rvm/install))

Install rvm:

Install GPG keys

```bash
gpg --keyserver keyserver.ubuntu.com --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
```

Install rvm

```bash
\curl -sSL https://get.rvm.io | bash
```

Reload profile

```sh
source ~/.bashrc
```

Check rvm version

```bash
rvm -v
```

You should see the version of rvm, that means you seccussfully install rvm.

Then install and use ruby 3.2.2

```bash
rvm install 3.2.2
rvm use 3.2.2
rvm use 3.3.2 --default 
```

### Install postgresql

On Ubuntu, you can install postgresql by using apt

```bash
sudo apt update
sudo apt install postgresql postgresql-contrib
```

Then, start postgresql service

```bash
sudo systemctl enable postgresql
sudo systemctl start postgresql
```

Check the postgresql service status

```bash
sudo systemctl status postgresql
```

you should see the status of postgresql service is `active`.

Create a role in postgresql

```bash
sudo -i -u postgres
psql
```

Then, create a user and alter the role to superuser

```postgresql
CREATE USER youruser WITH ENCRYPTED PASSWORD 'yourpassword' SUPERUSER;
```

## Setup on local and deploy on Heroku

### Set up the project on local

***We have two repositories for this project. one is the review system repo, which is the backend and frontend parts of the project. Another one is the database system, which is for the database***

Clone the review system repo [review system](https://github.com/RubyOffTheRailsTAMU/PhD-Application-Review-System)

```sh
git clone git@github.com:RubyOffTheRailsTAMU/PhD-Application-Review-System.git
```

Get in the root of the project:

```sh
cd PhD-Application-Review-System
```

Install all dependencies:

```sh
bundle install
```

Set up local database:

```sh
rails db:migrate
rails db:seed
```

Now, you can run the review project homepage locally:

```sh
rails s
```

Now, clone the database system repo [database system](https://github.com/RubyOffTheRailsTAMU/PhD-Application-Review-System-Database-management)

```sh
git clone git@github.com:RubyOffTheRailsTAMU/PhD-Application-Review-System-Database-management.git
```

Get in the root of the database project:

```sh
cd PhD-Application-Review-System-Database-management
```

Install all dependencies:

```sh
bundle install
```

Set up local database:

```sh
rails db:migrate
rails db:seed
```

Now, you can start the database management system locally:

```sh
rails s
```

### Deploy the project on heroku

***We have 2 repo to deploy, so we will have 2 apps on heroku***

Register an account on heroku: <https://signup.heroku.com/>.

Download heroku CLI: <https://devcenter.heroku.com/articles/heroku-cli>.

After that, check the version of heroku CLI:

```sh
heroku -v
```

You should see the version of Heroku CLI, that means you seccussfully install Heroku CLI.

Then, login to heroku:

```sh
heroku login
```

First, deploy the review system repo.

Go to the terminal of the review system project, and create an app for review system:

```sh
heroku create <you-review-system-app-name>
```

Go to your Heroku console, and add the heroku remote:

```sh
heroku git:remote -a <you-review-system-app-name>
```

Deploy the app on Heroku:

```git
git add .
git commit -am "make it better"
git push heroku main
```

And then, go heroku console to check whether the app is deployed.

If you want to check the status of the app:

```sh
heroku ps
```

If you want to check the logs of the app:

```sh
heroku logs
```

Then, deploy the database system repo.

The steps are the same as the review system repo:

Go to the terminal of the database system, and then:

```sh
heroku create <you-database-system-app-name>
```

Go to your Heroku console, and add the heroku remote:

```sh
heroku git:remote -a <you-database-system-app-name>
```

Deploy the app on Heroku:

```git
git add .
git commit -am "make it better"
git push heroku main
```

And then, go heroku console to check whether the app is deployed.

If you want to check the status of the app:

```sh
heroku ps
```

If you want to check the logs of the app:

```sh
heroku logs
```

### Admin Account

Admin account is used to manage the review system and the database system, you can use the following account to login the database management system.
Set admin account in `db/seeds.rb`

### Google OAuth

We use Google OAuth to login the review system, so you need to set up the Google OAuth in your Google Cloud Platform.

### Public Key and Private Key

We use public key and private key for JWT authentication, you need to set up the public key and private key in your local environment and then store them on Heroku. You can check `config/initializers/jwt.rb` to see how we use the public key and private key.

If you want to know more about JWT, you can check `./JWT.md` and go [JWT](https://jwt.io/).

Here is a way to generate keys, you can use other proper ways to generate your own keys.

Generate private key:

```sh
openssl genrsa -aes256 -out private_key.pem 2048
```

Generate public key:

```sh
openssl rsa -pubout -in private_key.pem -out public_key.pem
```

Then, use base64 to encode the private key and public key:

```ruby
require 'base64'

encoded_private_key = Base64.strict_encode64('Your private key here')

encoded_public_key = Base64.strict_encode64('Your public key here')
```

Then set the environment variables in your local environment, add the keys in the `.env` file, save encoded_private_key in the review system repo, and save encoded_public_key in the database system repo.

```.env
# review system repo
PRIVATE_KEY=<encoded_private_key>
```

```.env
# database system repo
PUBLIC_KEY=<encoded_public_key>
```

Now, you can use the APIs for database locally. Because we will deploy the project on Heroku, you should also add these `encoded_private_key` and `encoded_public_key` on Heroku. Here are steps:

1. Go Heroku console, and go to the review system app.
2. Go to the `Settings` tab, and click `Reveal Config Vars`.
3. Add `PRIVATE_KEY` in the `KEY` column, and add `encoded_private_key` in the `VALUE` column.
4. Do the same steps on the database system app, but add `PUBLIC_KEY` in the `KEY` column, and add `encoded_public_key` in the `VALUE` column.

Then you can use the APIs for database on Heroku.

### Test

You can go `/spec` to see the rspec tests and `/features` to check the cucumber tests.

Run rspec test:

```sh
bundle exec rspec
```

Run cucumber test:

```sh
bundle exec cucumber
```

And you can see the aggregate coverage of the test in `coverage/index.html`.

If you want a report for the test, you can run:

```sh
bundle exec cucumber --publish
```

Then, click the link to see the report.

### Motor Admin

You can view information about the Mortor Admin at this link: [Motor Admin](https://github.com/RubyOffTheRailsTAMU/motor-admin-rails).
