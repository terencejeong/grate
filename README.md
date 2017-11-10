# README

Graté is an application that allows users to buy and sell DJ equipment.
The users also have a profile where they can get into contact with other users.

Currently it is in v-1 and the key functions are stated below

- Users can sell DJ equipment on the website, where the item has a price,
 description, name, part of a category and an image of the equipment.
- The website also allows users who do not sign up to view the items on the
platform. However, to buy items or to  view profiles, the user must login or
create an account. The login system used in the application is Devise.
- Users can also buy the DJ equipment where the payments are made via stripe.
- After the user pays for an item, they get an email via MailGun with a receipt
of their purchase.
- Users can also go to the profile of a seller and see the items that are only
sold by that user.
- Users can message each other via the applications internal messaging system.
- Users can also leave a review on the profile page of another user. This system
is built for reviewing a seller.

Several steps have been put in place for Version 2 of Graté. Currently, for v-1
the user can receive DJ party offers from other users. However, for v-1 the user
cannot accept these bookings. Version 2 will have a simple booking system where
users can book other users to DJ at the event they may have.

Version 2 will have the following features
- Users will be able to upload a Video of their DJ sets/concerts they played at.
- Users will be able to accept bookings from offers they receive from other
users.
- Users will be able to say where they have previously played before.
- Will look at integration with Anyone-Anywhere app which links big name DJs with
event organizers.

#Deliverables
<!-- Design Documentation
Demonstrate your ability to break down the problem and design a solution.
- 1 - One page summary of your application including problem definition, solution.
* [Summary](https://docs.google.com/a/ait.nsw.edu.au/document/d/13mxjUNT3aQET6Jh71z_n_RpkSBQhbySZ9jXxI2_yUg0/edit?usp=sharing) -->

Buying DJ equipment is expensive and hard to get. There is no platform for DJ’s to sell or rent equipment that they are not using.

There is also no platform for DJ’s to have a profile where people can see what music they play, if they do parties, and how much they charge.

# The Target

# SELLERS
DJ’s with equipment they are not using and want to sell.

DJ’s with equipment that they want to rent.

DJ’s who are just starting out and cannot afford to have a website or to sign to a label.


# BUYERS
People who want to rent DJ equipment.

People who want to find a DJ for their parties.

# The Pains

# SELLERS
Have to list the item on eBay or GumTree not a community for DJ’s to sell items.

Renting DJ equipment is from DJ Warehouse, who control the prices. A DJ can’t rent any equipment they may have.

No platform for DJ’s to rent their equipment they are not using.

# BUYERS
No simple website with just second hand DJ equipment, hard to find the items that I want to buy.

Renting equipment is expensive and has to be done from DJ Warehouse.

Also, no DJ’s to contact who have actual experience. I want to learn how the equipment may work.

There is no place to contact DJ’s about if they are available for a party or for general advice.


- 2 - User stories for the whole application.
- 3 - A workflow diagram of the user journey/s.
- 4 - Wireframes for at least 5 screens.
- 5 - Entity Relationship Diagram (ERD).
- 6 - Project plan and estimation.



Rails application code
Demonstrate Ruby on Rails development skills.

- [x] Create your application using Ruby on Rails.
- [x]  Demonstrate knowledge of Rails conventions.
- [x]  Use postgresql database in development.
- [x] Use an API (eg. Omniauth, Geocoding, Maps, other..).
- [ ] Use appropriate gems.
- [x] Use environmental variables to protect API keys etc. (dotenv)
- [x] Implement a payment system for your product. (e.g. Stripe)
- [x] Your app must send transactional emails (eg. using Mailgun).
- [x] Your app should have an internal user messaging system.
- [x] Your app will have some type of searching, sorting and/or filtering capability.
- [x] Your app will have some type of file uploading capability (eg. images).
- [x] Your app will have authentication (eg. Devise, must have full functionality in place).
- [x] Your app will have authorisation (users have restrictions on what they can see and edit).
- [ ] Your app will have an admin dashboard for the admin user to administrate the site.
- [x] Document your application with a README that explains how to setup, configure and use your application.






# Project Title

One Paragraph of project description goes here

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

What things you need to install the software and how to install them

```
Give examples
```

### Installing

A step by step series of examples that tell you have to get a development env running

Say what the step will be

```
Give the example
```

And repeat

```
until finished
```

End with an example of getting some data out of the system or using it for a little demo

## Running the tests

Explain how to run the automated tests for this system

### Break down into end to end tests

Explain what these tests test and why

```
Give an example
```

### And coding style tests

Explain what these tests test and why

```
Give an example
```

## Deployment

Add additional notes about how to deploy this on a live system

## Built With

* [Dropwizard](http://www.dropwizard.io/1.0.2/docs/) - The web framework used
* [Maven](https://maven.apache.org/) - Dependency Management
* [ROME](https://rometools.github.io/rome/) - Used to generate RSS Feeds

## Contributing

Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/your/project/tags).

## Authors

* **Billie Thompson** - *Initial work* - [PurpleBooth](https://github.com/PurpleBooth)

See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Hat tip to anyone who's code was used
* Inspiration
* etc
