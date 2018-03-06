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

Set the authentication.

```
before_filter :authenticate_user!
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

```
add_reference :invites, :user, index: true, foreign_key: true
add_reference :invites, :event, index: true, foreign_key: true
```

Add new file ('myinvites') to invites and configure it's route.

```
get '/invites/my_invites', to: 'invites#my_invites'
```

Configure controllers for events and invites (instance variables).

Events:

```
def index
   @events = current_user.events.order(startsAt: :ASC)
   @invites = Event.joins(:invites).where(:invites => {:user_id => current_user}).order(startsAt: :ASC)
end
```    

Invites:
```
def index
  @invites = Event.select("*").joins(:invites).where(:invites => {:user_id => current_user}).order(startsAt: :ASC)
end

def my_invites
  @invites = Event.select("*").joins(:invites).where(:events => {:user_id => current_user}).order(title: :ASC)
end

def invite_params
   params.require(:invite).permit(:attending, :user_id, :event_id)
end
```

Set up valiations in models.

Events:
```
validates :title, presence: true
validates :location, presence: true
validates :title, uniqueness: true
```
Invites:
```
validates :user_id, uniqueness: { scope: :event_id, message: "has already been invited to this event." }
validates :user_id, presence: true
validates :event_id, presence: true
```

Edit and organize app views (index, show, forms) and their connections (links).

Style the app with CSS.
