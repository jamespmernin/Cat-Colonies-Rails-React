# Cat Colonies App!

<img src="alfie.jpg" width="500" />
^^ Alfie!!

### Overview

We're going to build a Rails API with two tables -- cats and colonies -- that have a many-to-many relationship. We will also create a React app that interacts with our API! (Don't know about cat colonies in NYC? check them out [here](https://www.neighborhoodcats.org/)!)

### Setup

- Fork and clone this repo.
- `cd` into the cloned repo and create a new rails app with the `--api` argument so that we can create our own API that will be accessed through a front end.
```
rails new cat-colonies -MT --skip-active-storage --api --database=postgresql
```
Also run `rails db:create` to create the database.

### The models

Because each cat in New York can live in many colonies, and each colony houses many cats, we will set up our models with a many-to-many relationship.

We first create the models for cats and colonies:
```
rails g model Cat name:string breed:string age:integer
rails g model Colony name:string borough:string
```
...and then we create a join table:
```
rails g migration CreateJoinTableCatsColonies cats colonies
```

We will then use the `has_and_belongs_to_many` association in each model file:
```
class Cat < ApplicationRecord
  has_and_belongs_to_many :colonies
end
```
```
class Colony < ApplicationRecord
  has_and_belongs_to_many :cats
end
```

Now you can run `rails db:migrate` in the root of the rails app.

### The seed data

Now that we have our models set up, let's create some seed data! Try creating five or so cats and colonies. The structure will look like so (you can make up the names of the colonies; I couldn't find a good list of them online):
```
cat1 = Cat.create(name: "Alfie", breed: "Tabby", age: 3)
colony1 = Colony.create(name: "Greenpoint kitty kastle", borough: "Brooklyn")
colony1.cats.push(cat1)
```

Now that your data is created, run `rails db:seed`.

### Routes

Make sure you create the routes by adding resources for cats and colonies in the `routes.rb` file:

```
resources :cats
resources :colonies
```

### Controllers

Create two controller files: `cats_controller.rb` and `colonies_controller.rb`. Let's just deal with index and show for now. Here's an example structure:

```
class CatsController < ApplicationController
  def index
    @cats = Cat.all
    render json: @cats, include: :colonies, status: :ok
  end

  def show
    @cat = Cat.find(params[:id])
    render json: @cat, include: :colonies, status: :ok
  end
end
```

Launch the rails server with `rails s` and visit http://localhost:3000/cats, http://localhost:3000/cats/1, http://localhost:3000/colonies, and http://localhost:3000/colonies/1. You should see JSON data showing the wittle kitties & their outdoor homes!

## Setting up the front end

### CORS

First, we'll need to prevent CORS issues by allowing communication between the API we just created and the React app we are going to create.

First, add the following to your gem file:
```
gem 'rack-cors', :require => 'rack/cors'
```
Next, head to the `application.rb` file in your `config` folder and, *inside the Application class*, add the following:
```
config.middleware.use Rack::Cors do
  allow do
    origins '*'
    resource '*', :headers => :any, :methods => [:get, :post, :put, :options, :delete], :credentials => false
  end
end
```

## BONUS!

Great! Now we can create our front end...

### React app

In the root of your rails directory, create a new React app with `npx create-react-app client`. Get rid of the boilerplate annoyances, and start hacking!

This is going to be very similar to how you've built React apps using external APIs before, so please reference old lessons and projects if you get stuck. Just remember you will be making axios calls to your own API, i.e. using http://localhost:3000/cats.

You can get creative with your app here. Remember the many options we have for dealing with an API in React. We can create a helper file to create our axios calls, or we could create them directly in App.jsx or in any other component. Just make sure you can view the following resources on the front end:
- All cats
- All colonies
- One cat, with all the colonies it lives in
- One colony, with all the cats who live there
- Create `create`, `delete`, and `edit` routes and views for your cats and colonies.
- Style it up!
