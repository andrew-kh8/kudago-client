# KudagoClient

API client for [kudago api](https://docs.kudago.com/api/#)

## Installation

Just add this line to your Gemfile

```ruby
gem "kudago-client"
```

And then (I'll fix it, like autoload or smt)
```ruby
require "kudago_client"
```

## Usage

This is an open API, so no key is required


### Client

id/slug is required, params isn't required

```ruby
client = KudagoClient::Client.new(lang: "ru")

# get entity
client.agent(agent_id, {}) # KudagoClient::Entities::Agent
client.location(slug, {}) # KudagoClient::Entities::Location
client.role(role_id, {}) # KudagoClient::Entities::Role
client.event_category(event_category_id, {}) # KudagoClient::Entities::EventCategory
client.place_category(place_category_id, {}) # KudagoClient::Entities::PlaceCategory
client.movie(movie_id, {}) # KudagoClient::Entities::Movie
client.showing(showing_id, {}) # KudagoClient::Entities::MovieShowing
client.place(place_id, {}) # KudagoClient::Entities::Place
client.piece_news(news_id, {}) # KudagoClient::Entities::News
client.news_comment(news_id, comment_id, {}) # KudagoClient::Entities::Comment
client.event(event_id, {}) # KudagoClient::Entities::Event
client.event_comment(event_id, comment_id, {}) # KudagoClient::Entities::Comment
client.list(list_id, {}) # KudagoClient::Entities::List
client.list_comment(list_id, comment_id, {}) # KudagoClient::Entities::Comment

# get entity list
client.agents({}) # KudagoClient::EntitiesList::AgentList
client.locations({}) # KudagoClient::EntitiesList::LocationList
client.roles({}) # KudagoClient::EntitiesList::RoleList
client.event_categories({}) # KudagoClient::EntitiesList::EventCategoriesList
client.place_categories({}) # KudagoClient::EntitiesList::PlaceCategoriesList
client.movies({}) # KudagoClient::EntitiesList::MovieList
client.movie_comments(movie_id, {}) # KudagoClient::EntitiesList::CommentList
client.showings({}) # KudagoClient::EntitiesList::MovieShowingList
client.movie_showings(movie_id, {}) # KudagoClient::EntitiesList::MovieShowingList
client.places({}) # KudagoClient::EntitiesList::PlaceList
client.place_comments(place_id, {}) # KudagoClient::EntitiesList::CommentList
client.news({}) # KudagoClient::EntitiesList::NewsList
client.news_comments(news_id, {}) # KudagoClient::EntitiesList::CommentList
client.events({}) # KudagoClient::EntitiesList::EventList
client.event_comments(event_id, {}) # KudagoClient::EntitiesList::CommentList
client.events_of_the_day({}) # KudagoClient::EntitiesList::EventList
client.lists({}) # KudagoClient::EntitiesList::ListList
client.list_comments(list_id, {}) # KudagoClient::EntitiesList::CommentList
client.search(query, {}) # KudagoClient::EntitiesList::MultipleList

# get another page of list
client.next_page(list, {})
client.previous_page(list, {})
```


### Lists

```ruby
list = KudagoClient::EntitiesList::BaseList.new

list.count # get count of all items
list.next_url # url to next page
list.previous_url # url to previous page
list.items # items on page
list.lang # lang of request
```


### Error

```ruby
begin
    KudagoClient::Client.new.search("new", {page: 999}) # KudagoClient::Error
rescue KudagoClient::Error => error
    error.message # "Неправильная страница"
    error.status # 404
    error.reason # "Not Found"
end
```

## Development

You can contribute to this gem :)

Just fork the repo and then make PR

I wrote a simple [To Do list](./to_do.md)

## Contributing


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the KudagoClient project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/kudago-client/blob/master/CODE_OF_CONDUCT.md).
