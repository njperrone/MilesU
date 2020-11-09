var someObject =  {str: "Some text", id: 5};
console.log(someObject);

var car = "Vroom";
console.info("My car goes ", car," real good.", someObject);

// pauses when dev window open in browser
//debugger;

console.log("Group one");
console.group("First group");
console.log("inside first");
console.group("Second grop");
console.log("second group inside");
console.groupEnd();
console.groupEnd();

// will the console out a function?

let funcfunc = function valuable(){ console.log("valuable") };

console.log(funcfunc);
valuable();
console.log(valuable());