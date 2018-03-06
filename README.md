Generate events scaffold and run migration.

```
rails generate scaffold Event title:string describtion:text location:string startsAt:datetime endsAt:datetime
```

Add and install gem for devise.

```
gem 'devise'
bundle install
```

Generate users and it's views.

```
rails generate devise user
```

Add user_id to events and run migration.

```
rails g migration AddUserToEvent user:belongs_to
```

Edit events controller.

```
@destination = current_user.destinations.build(destination_params)
```

Generate invites scaffold and run migration.

```
rails generate scaffold Invite attending:boolean
```

Set valid connections between users, events and invites.

Add new file to invites and configure it's route.

Configure controllers for events and invites (instance variables).

Set up valiations in models.

Edit and organize app views and their connections (links).

Style the app with CSS.
