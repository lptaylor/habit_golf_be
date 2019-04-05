# Habit Golf
Capstone Project at the Turing School of Software and Design. This is the backend API for that project.

## Introduction
Habit Golf is the capstone project for a team composed of members of both the  [Back-End Engineering Program](https://turing.io/programs/back-end-engineering/) and the [Front-End Engineering Program](https://turing.io/programs/front-end-engineering/) at the [Turing School of Software & Design](https://turing.io/). Habit Golf is a full-stack application built using a Rails API backend using GraphQL and a React frontend. [This repo](https://github.com/lptaylor/habit_golf_be) is the Habit Golf API. You can find the [frontend repo here](https://github.com/ericweissman/habit-golf-fe).

[Deployed Frontend Site](ADD LINK LATER)

[Deployed Backend API](https://habit-golf-api.herokuapp.com/)

[Scrum Board](https://waffle.io/lptaylor/habit_golf_be)

## Frontend Example
TODO: ADD EXAMPLE LINK LATER
![Habit Golf Main Page]()

## Initial Setup
To install this project on your local machine:
1. Clone the repo to your machine:
```
git clone git@github.com:lptaylor/habit_golf_be.git
```
2. Change into the new directory.

3. Install Ruby(2.4.1) and Rails 5.2.3 on your local machine.

4. Install bundler

![bundler install](readme_images/bundler-gem-install)

4. Install dependencies:
```
bundle install
```
## Running the Server Locally
To run the code locally, use the following command to start the development server:
```
rails s
```
Once running, point your browser to:
```
http://localhost:3000/graphiql
```
This will bring up the IDE to allow you to send queries locally.

## Endpoint for the API
As with all GraphQL applications there is only a single endpoint found at https://habit-golf-api.herokuapp.com/graphql.

Additionally, a CORS package has been added to allow you to consume this API without CORS errors.

The frontend for this app and it's documentation can be found at https://github.com/ericweissman/habit-golf-fe.

## Queries
All responses return a JSON object with the queried fields available.

### Important
These queries can be run in POSTMAN to check they are working in the production environment by running the development server as described above by using the graphiql IDE and sending a request with the network developer tools tab open. If you click on the request and right clicking (Windows) or ctrl+click (Mac) and copying the request as cURL. From there open POSTMAN and click import paste the raw text into the box and set the request type to POST and the url from http://localhost:3000/graphiql to https://habit-golf-api.herokuapp.com/graphql).

## Examples of Accepted Basic Queries in IDE

### Players
There is an optional argument for players query if none given will return all players.

```
{players(*optional argument ids: [Array of playerIds]){
	id
  name
  }
}
```

### Shots
There are two optional arguments for shots query if none given will return all shots. rating is an Integer.

```
{shots(*optional argument ids: [Array of shotIds] OR rating: [Array of shotRatings]){
	id
  rating
  }
}
```

### Clubs
There are two optional arguments for clubs query if none given will return all clubs. styleOfClub is an Integer.

```
{clubs(*optional argument ids: [Array of clubIds] OR rating: [Array of styleOfClubs]){
	id
  styleOfClub
  }
}
```

### Player Statistics
The playerId argument is required.
```
{
  playerStats(playerId: 1){
    playerId
    greatShotPercentage
    hookPercentage
    pullPercentage
    pushPercentage
    slicePercentage
  }
}
```
## Nested queries

### Clubs and Shots
Same optional arguments apply as the basic queries but you can also grab shots by their association with their clubs.
```
{clubs(*optional argument ids: [Array of clubIds] OR rating: [Array of styleOfClubs]){
	id
  styleOfClub
  shots{
    id
    rating
    }
  }
}
```

## Mutations

### Players

#### Create Player
All Fields are required!
```
mutation{createPlayer(name: "someName", email: "someEmail", password: "somePassword")
	{
    id
    name
  }
}
```

## How to Contribute
If you wish to contribute to this repo, you are welcome to make a PR and we would be happy to review it. Please use the Pull Request Template that has been included with all appropriate fields filled in.


## Built With
* [Ruby](https://www.javascript.com/)
* [Ruby on Rails](https://expressjs.com/)
* [PostgreSQL](https://www.postgresql.org/)
* [React](https://reactjs.org/)
* [GraphQL](https://graphql.org/)
* [Apollo](https://www.apollographql.com/)
* [Waffle](https://waffle.io/)
* [RSpec](https://www.chaijs.com/)

## Authors
**[Lance Taylor](https://github.com/lptaylor)**

**[Nick Lindeberg](https://github.com/NickLindeberg)**

**[Eric Weissman](https://github.com/ericweissman)**
