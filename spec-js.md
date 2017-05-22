# Specifications for the Rails with jQuery Assessment

Specs:
- [x] Use jQuery for implementing new requirements | You can see this throughout the application. Animations, appending, event listeners, etc.
- [x] Include a show resource rendered using jQuery and an Active Model Serialization JSON backend. | This can be seen on the index page. It's not exactly a "show" page but I think it was the most logical way to work this into the assignment. By scrolling to the bottom of the page, the app loads and appends the next 10 decisions onto the page.
- [x] Include an index resource rendered using jQuery and an Active Model Serialization JSON backend. | This is available in the "most decisive" or "least decisive" tabs, where clicking on a user shows their previous votes as well as dilemmas posted.
- [x] Include at least one has_many relationship in information rendered via JSON and appended to the DOM. | This takes place during the script for `doVote`, which was the first bit of script that I wrote for the app.
- [x] Include at least one link that loads or updates a resource without reloading the page. | Asking a question creates a drop down form, and submitting that form submits the post, all without reloading the page.
- [x] Translate JSON responses into js model objects. | Can be seen with the user interactions.
- [x] At least one of the js model objects must have at least one method added by your code to the prototype.

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
