# PhD-Application-Review-System

Organization:	Department of Computer Science and Engineering
Contact name:	Prof. Khanh Nguyen
Contact email:	khanhtn@tamu.edu

# Team Contact Information

Product Owner: Tanay Patankar tanayp@tamu.edu

Scrum Master: Francesco Romano fwromano@tamu.edu

Shreyas Shivakumar Kasetty shreyasskasetty@tamu.edu

Brian Munoz brian.m@tamu.edu

Meetansh Gupta guptameetansh@tamu.edu

Ruofei Xu xrf@tamu.edu

-----

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

Here I recommend using rvm, a tool for managing Ruby with different versions. (Refer to this [link](https://rvm.io/rvm/install))

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

You should see the version of rvm, which means you have successfully installed rvm.

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

### Setting ENV variables  in Development Environment:

Create .env file in the root directory and set the following environment variables.

```
DATABASE_SERVER_URL=http://127.0.0.1:3001
PHD_APP_REVIEW_URL=http://127.0.0.1:3000
```
>**NOTE**:  There are few more environment variables which needs to be set which are captured in the next few sections.

Install all dependencies:
> **Note:** Delete the `Gemfile.lock` before running `bundle install`.

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
-------

### Setting up Database System
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

----

### Deploy the project on Heroku

***We have 2 repo to deploy, so we will have 2 apps on Heroku ***

Register an account on Heroku: <https://signup.heroku.com/>.

Download Heroku CLI: <https://devcenter.heroku.com/articles/heroku-cli>.

After that, check the version of Heroku CLI:

```sh
Heroku -v
```

You should see the version of Heroku CLI, which means you have successfully installed Heroku CLI.

Then, login to Heroku:

```sh
heroku login
```

First, deploy the review system repo.

Go to the terminal of the review system project, and create an app for the review system:

```sh
heroku create <you-review-system-app-name>
```

Go to your Heroku console, and add the Heroku remote:

```sh
heroku git:remote -a <you-review-system-app-name>
```

Deploy the app on Heroku:

```git
git add .
git commit -am "make it better"
git push heroku main
```

And then, go Heroku console to check whether the app is deployed.

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

Then, go to the Heroku console to check whether the app is deployed.

If you want to check the status of the app:

```sh
heroku ps
```

If you want to check the logs of the app:

```sh
heroku logs
```

### Setting Environment Variables in Heroku

1. **Login to Heroku CLI**: First, ensure you are logged into the Heroku CLI.
   ```bash
   heroku login
   ```
2. ```bash
   cd your-app-directory
   ```
3. ```bash
   heroku config:set DATABASE_SERVER_URL=https://phdapplicationsystemdatabase-5e5fc255409c.herokuapp.com -a your-app-name
   ```
4. ```bash
   heroku config:set PHD_APP_REVIEW_URL=https://phdappreview-2530b5efb143.herokuapp.com -a your-app-name
   ```



### Admin Account

An admin account is used to manage the review system and the database system, you can use the following account to log into the database management system.
Set admin account in `db/seeds.rb`

### Google OAuth

We use Google OAuth to log in to the review system, so you need to set up the Google OAuth in your Google Cloud Platform. You MUST do this with your TAMU Google account.

Venture here: https://console.developers.google.com/cloud-resource-manager to set up your Google credentials. Click on the CREATE PROJECT button.

After the project is created, select the “Credentials” option from the menu on the left then you can select the “OAuth Consent Screen”. Set it to type Internal and click Create.

Add the required information and then in the "Authorized domains" section, add the endpoints for all of the valid places you can use Google auth. For example

```sh
https://phdappreview-2530b5efb143.herokuapp.com/auth/google_oauth2/callback
http://127.0.0.1:3000/auth/google_oauth2/callback
```

Create it and find the client id and client secret. Add it to the .env file

```.env
GOOGLE_CLIENT_ID=
GOOGLE_CLIENT_SECRET=
```

Then, you should add your `@tamu.edu` email to the `app/assets/whitelist.txt` file. Then you can use your TAMU email to log into the review system.

Refer to this for any more specific information: https://medium.com/@jenn.leigh.hansen/google-oauth2-for-rails-ba1bcfd1b863


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

Now, you can use the APIs for the database locally. Because we will deploy the project on Heroku, you should also add these `encoded_private_key` and `encoded_public_key` on Heroku. Here are steps:

1. Go Heroku console, and go to the review system app.
2. Go to the `Settings` tab, and click `Reveal Config Vars`.
3. Add `PRIVATE_KEY` in the `KEY` column, and add `encoded_private_key` in the `VALUE` column.
4. Do the same steps on the database system app, but add `PUBLIC_KEY` in the `KEY` column, and add `encoded_public_key` in the `VALUE` column.

Then you can use the APIs for the database on Heroku.

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

You can view information about the Motor Admin at this link: [Motor Admin](https://github.com/RubyOffTheRailsTAMU/motor-admin-rails).
