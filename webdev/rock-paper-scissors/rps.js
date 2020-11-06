//enums and other global things here
const RPS = {
    ROCK : 0,
    PAPER : 1,
    SCISSORS : 2
}
const WINNERS = {
    COMPUTER : 0,
    PLAYER : 1,
    TIE : 2
}

function playGame(){
// main function
    // initialize tracking
    let results = [];
    let winner;
    let rounds;
    let names = ["Rock", "Paper", "Scissors"];
    let trackArr;
    
    //prompt rounds
    rounds = prompt("Welcome to Rock, Paper, Scissors! How many rounds do you want to play?");
    // debugger;
    // get pick
    for (let i = 0; i < rounds; i++){

    trackArr = winnerTracking(results);
    alert(`Round ${i+1}. Wins: ${trackArr[1]}. Losses: ${trackArr[0]}. Ties: ${trackArr[2]}.`);
    let computerPick = randomNumber3();
    let playerPick = getPick();
    // debugger;
    // determine and track WINNERS
    alert(`The computer chose ${names[computerPick]}`);
    winner = rockPaperScissors(computerPick, playerPick);
    results.push(winner);
    }

    // report winner and history
    trackArr = winnerTracking(results);
    alert(`The game is over! You won ${trackArr[1]} times. You lost ${trackArr[0]} times. You tied with the computer ${trackArr[2]} times.`);
    alert("Thank you for playing.");
}

//helpers
function rockPaperScissors(computerPick, playerPick){
    // RPS game here
    let winner;
    // debugger;
    if (computerPick === playerPick){
        winner = WINNERS.TIE;
        alert("It was a tie, sorry.");
    }else if ( computerPick === RPS.ROCK){
        switch (playerPick){
            case RPS.PAPER:
                winner = WINNERS.PLAYER;
                alert("You won!");
                break;
            case RPS.SCISSORS:
                winner = WINNERS.COMPUTER;
                alert("You lost. Tough luck.");
                break;
        }
    } else if (computerPick === RPS.PAPER){
        switch (playerPick){
            case RPS.SCISSORS:
                winner = WINNERS.PLAYER;
                alert("You won!");
                break;
            case RPS.ROCK:
                winner = WINNERS.COMPUTER;
                alert("You lost. Tough luck.");
                break;
        }
    } else if (computerPick === RPS.SCISSORS){
        switch (playerPick){
            case RPS.ROCK:
                winner = WINNERS.PLAYER;
                alert("You won!");
                break;
            case RPS.PAPER:
                winner = WINNERS.COMPUTER;
                alert("You lost. Tough luck.");
                break;
        }
    }

    // debugger;
    return winner;
}

function randomNumber3(){
    // debugger;
    let randomNum = Math.random();

    randomNum = Math.floor(randomNum*3);

    // debugger;
    return randomNum;
}

function getPick(){
    let pick = prompt(`Rock, Paper, or Scissors?`);
    let pickNum;
    // debugger;
    pick = pick.toLowerCase();

    switch (pick){
        case "rock":
            pickNum = RPS.ROCK;
            break;
        case "paper":
            pickNum = RPS.PAPER;
            break;
        case "scissors":
            pickNum = RPS.SCISSORS;
            break;
        default:
            pickNum = RPS.ROCK;
            break;
    }
    // debugger;
    return pickNum;
}

function winnerTracking(winArr){
    // use a tracking array
    let trackArr = [0,0,0];
    // i corresponds to WINNERS value
    // tracker[i] is number of wins for each i.
    if (winArr.length > 0){
        winArr.forEach(element => {
            trackArr[element] += 1;
        });
    }

    return trackArr;
}