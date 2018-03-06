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

```
*:focus {
    outline: none;
}

body {
  background-color: #03407d;
  color: white;
  font-family: verdana, arial, helvetica, sans-serif;
  font-size: 13px;
  line-height: 18px;
  text-align: center;
}

table {
  margin: auto;
  width: 90%;
  background-color: #555;
  border: 2px solid black;
  border-radius: 12px;
  border-collapse: collapse;
}

th {
  text-align: center;
  text-decoration: none;
  color: white;
  background-color: #262659;
  padding: 20px;
  border: 2px solid black;
  font-family: Verdana;
  font-size: 20px;
  font-weight: bold;
}

td {
  border: 2px solid black;
  font-family: Verdana;
  font-size: 16px;
  padding: 10px;
}

.table-button {
  width: 50%;
  font-size: 16px;
  margin: 0 auto 0 auto;
  padding: 10px;
}

h1 {
  margin-top: 50px;
  font-size: 44px;
  font-family: Verdana;
  font-weight: bold;
  -webkit-text-stroke: 2px black;
}

.no-record {
  width: 90%;
  margin: auto;
  background-color: #555;
  border: 2px solid black;
  padding: 20px 0 20px 0;
  font-size: 20px;
  font-family: Verdana;
}

.login-buttons {
  width: 15%;
  margin: 10px auto 10px auto;
}

#respond-button {
  margin: 10px auto 10px auto;
}

#show-event {
  width: 40%;
  margin: 20px auto 20px auto;
  background-color: #555;
  border: 2px solid black;
  padding: 20px;
  font-size: 20px;
  font-family: Verdana;
}

.show-bolds {
  display: block;
  color: #111;
  font-size: 30px;
  font-weight: bold;
}

#profile {
  width: 90%;
  margin: 20px auto 0 auto;
  text-align: right;
}

form {
  width: 40%;
  margin: 20px auto 20px auto;
  background-color: #555;
  border: 2px solid black;
  padding: 20px;
  font-size: 20px;
  font-family: Verdana;
}

label {
  display: block;
  margin-top: 20px;
  margin-bottom: 10px;
  color: #111;
  font-size: 20px;
  font-weight: bold;
}

em {
  display: block;
  margin-top: 0px;
  margin-bottom: 10px;
  font-size: 18px;
}

#min-chars {
  margin-top: 5px;
}

.att-label {
  display: inline-block;
}

#att-field {
  text-align: left;
  width: 25%;
  margin: auto;
}

input[type="radio"] {
  &:hover {
    cursor: pointer;
  }
} 

input[type="submit"]  {
  color: white;
  background-color: #262659;
  font-family: Verdana;
  font-size: 20px;
  padding: 10px;
  box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24),0 17px 50px 0 rgba(0,0,0,0.19);
  border-radius: 12px;
  border: 2px solid black;
  transition-duration: 0.4s;
  margin-top: 20px;
  margin-bottom: 10px;
  width: 30%;
  
  &:hover {
    color: #000;
    background-color: #e7e7e7;
    cursor: pointer;
  }
}

input[type="text"], input[type="email"], input[type="password"]
{
  width: 40%;
  height: 30px;
}

textarea {
  width: 40%;
  height: 150px;
  resize: none;
}

select {
  height: 30px;
}

.inv-select {
  width: 30%;
}

.left-titles {
  width: 90%;
  margin: auto;
  text-align: left;
}

#events-buttons
{
  width: 90%;
  margin: auto;
}

.left {
  float: left;
  text-align: left;
}

.right {
  float: right;
  text-align: right;
}

p, ol, ul {
  font-family: verdana, arial, helvetica, sans-serif;
  font-size: 13px;
  line-height: 18px;
}

pre {
  background-color: #eee;
  padding: 10px;
  font-size: 11px;
}

a {
    display: inline-block;
    margin: auto;
    text-align: center;
    text-decoration: none;
    color: white;
    background-color: #262659;
    padding: 15px;
    border-radius: 12px;
    border: 2px solid black;
    transition-duration: 0.4s;
    font-family: Verdana;
    font-size: 20px;
    box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24),0 17px 50px 0 rgba(0,0,0,0.19);

  &:hover {
    color: #000;
    background-color: #e7e7e7;
  }
}

div {
  &.field, &.actions {
    margin-bottom: 0px;
  }
}

#notice {
  display: block;
  margin: 20px auto 0 auto;
  width: 40%;
  color: white;
  font-size: 20px;
  font-family: Verdana;
}

.field_with_errors {
  padding: 2px;
  display: block;
  margin: auto;
  color: #a31a1a;
}

#error_explanation {
  margin: auto;
  width: 450px;
  border: 2px solid #a31a1a;
  padding: 7px;
  padding-bottom: 0;
  background-color: #f0f0f0;

  h2 {
    text-align: left;
    font-weight: bold;
    padding: 5px 5px 5px 15px;
    font-size: 12px;
    margin: -7px;
    margin-bottom: 0px;
    background-color: #a31a1a;
    color: #fff;
  }

  ul li {
    text-align: left;
    color: black;
    font-size: 12px;
    list-style: square;
  }
}
```
