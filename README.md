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

### Review proejct local set up

Clone the repo:

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

If you don't have postgres on local, install postgres, create a user for it and alter the user to superuser.

Set up local database:

```sh
rails db:migrate
rails db:seed
```

Now, you can run the review project homepage locally:

```sh
rails s
```

### Database management system set up

Clone the repo:

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

### Deploy for review project

If you don't download heroku CLI, go download it: <https://devcenter.heroku.com/articles/heroku-cli>

Login to heroku:

```sh
heroku login
```

create an app:

```sh
heroku create <app-name>
```

Go to your Heroku console, and add the heroku remote:

```sh
heroku git:remote -a <your-app-name>
```

Heroku deploy:

```git
git add .
git commit -am "make it better"
git push heroku master
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

### Deploy for database management system

The same as the steps for deploying the review project.

## Test

You need migrate the test database before running the test:

```sh
rails db:migrate RAILS_ENV=test
```

Run cucumber test:

```sh
bundle exec cucumber
```

Run rspec test:

```sh
bundle exec rspec
```

Go `coverage/index.html` to check the coverage of the test.
