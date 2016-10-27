### Exercise 5 ###
library(jsonlite)
library(dplyr)
library(stringr)

# Write a function that allows you to specify a movie, then does the following:
Movie <- function(movie) {
    
    # Replace all of the spaces in your movie title with plus signs (+)
    movie.no.spaces <- str_replace_all(movie, ' ', '+')
  
  # Construct a search query using YOUR api key
  # The base URL is https://api.nytimes.com/svc/movies/v2/reviews/search.json?
  # See the interactive console for more detail:https://developer.nytimes.com/movie_reviews_v2.json#/Console/GET/reviews/search.json
  base.url <- 'https://api.nytimes.com/svc/movies/v2/reviews/search.json?'
  api.key <- '&api-key=efbb46b54b5a466e94769cb115bf397e'
  # Request data using your search query
  request <- (paste0(base.url,'query=',movie.no.spaces,api.key))
  
  # What type of variable does this return?
  results <- fromJSON(request)
  
  # Flatten the data stored in the `$results` key of the data returned to you
  flattened <- flatten(results$results)
  
  
  # From the most recent review, store the headline, short summary, and link to full article each in their own variables
  first.review <- flattened[1,]
  headline <- first.review$headline
  summary <- first.review$summary_short
  link <- first.review$link.url
  
  
  # Return an list of the three pieces of information from above
  info <- list(headline=headline, summary=summary, link=link)
  return(info)
}
# Test that your function works with a movie of your choice

