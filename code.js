// hoisting

function hoisting() {
  var a;
  var secondHoist;
  function firstHoist() {
    return "The first hoist"
  }
  console.log(a); // undefined
  console.log(firstHoist());  // "The first hoist"
  console.log(secondHoist); // "undefined"
  console.log(secondHoist()); // "secondHoist is not a function"

  a = 'a';
  secondHoist = function() {
     return "The second hoist"
  };
}

hoisting()
// thead-inverse

var hero = "Mario"
var game = {
  hero: "Luigi",
  properties: {
    hero: "toad",
    getHeroName: function() {
      return this.hero
	  }
  }
} 

game.properties.getHeroName() // "toad"
var myHerosName = game.properties.getHeroName; // func
myHerosName() // "Mario"

Dynamic Delete request:

When a user click on the delete
	-> It will make a delete request to the server to delete the question
	-> If delete is successful it will remove the question from the DOM.

	-> If delete is unsuccessful add a alert message that it failed
