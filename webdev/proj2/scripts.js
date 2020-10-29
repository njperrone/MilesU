//enums here
const rps = {
    ROCK : 0,
    PAPER : 1,
    SCISSORS : 2
}

// main function
function rockPaperScissors(){
    //RPS game here
    let computerPick = randomNumber3();

    if ( computerPick === rps.ROCK){
        //rock logic
    } else if (computerPick === rps.PAPER){
        //paper logic
    } else if (computerPick === rps.SCISSORS){
        //scissors logic
    } else{
        // you're mad
    }
}

//helpers
function randomNumber3(){
    let randomNum = Math.random();

    randomNum = Math.floor(randomNum*3);

    return randomNum;
}

function getPick(){
    let pick = prompt("Rock, Paper, or Scissors?");
    let pickNum;

    pick = pick.toLowerCase();

    switch (pick){
        case "rock":
            pickNum = rps.ROCK;
            break
        case "paper":
            pickNum = rps.PAPER;
            break;
        default:
            pickNum = rps.SCISSORS;
            break;
    }

    return pickNum;
}