# Copywriter App

## Description

This is a simple copywriter app. A user is able to create an account with their email and password. Once logged in, the user can select 'Create New Copy', and then input the required information. The app will create high quality copy based on the user's specifications. The user can then view all of their copies on the dashboard, and delete them if they wish. 

## Technologies Used

- Ruby on Rails
- Rspec (testing)
- Devise (authentication)
- Heroku (deployment)

## Gallery

![Screenshot](/app/assets/images/Screenshot1.png)

![Screenshot](/app/assets/images/Screenshot2.png)

![Screenshot](/app/assets/images/Screenshot3.png)

![Screenshot](/app/assets/images/Screenshot4.png)


Notes on setup:

- Clone the repository
- Use the command `EDITOR="code --wait" rails credentials:edit`to add openai credentials. You will have to provide an OpenAI API key from your OpenAI account.
- Run `bundle install`
- Run `rails db:migrate`
- Run `bin/dev` to start the server
- Visit `localhost:3000` in your browser
