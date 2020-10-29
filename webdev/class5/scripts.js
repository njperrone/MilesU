function promptDemo(){
    var person = prompt("Please enter your name");
    if (person != null){
        document.getElementById("demo").innerHTML = person;
    }
}

function confirmDemo(){
    confirm("Whoooooa there buckaroo. You really wanna yeehaw?");
}

function alertDemo(){
    alert("That's some real yeehaw, there.");
}