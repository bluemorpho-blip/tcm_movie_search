1. some sort of graphic on start-up - ASCII thingy
2. user menu for search choices:
    - start by asking for a month to search:
       I can use the same code-style as I did to add genre.html/ to scraping
       the movie's genre link -> just #{month} to the user's choice
   - title
   - year released
   - genre search
   - actor search
   - director search
      (use a case statement)
2a. Channge plans: User should be able to search any of the above choices
    without selecting the search object type - user can just enter search
    term and the application will search the entire collection and return
    the movie title, description, year released, actors, director.

3. end search method with return for another search until user enters "exit"

4.  Scraper and search functions in a separate class

Classes
 - Movie Search - where the work between the CLI and the scraper happens
 - CLI -          where the user interacts with the application
 - Scraper -      where the Scraping is happening!

Objectives:
  - 9/7/19  build methods in each class to pass parameters to the other classes 
            and return some value to the method. (Practice working in classes).
