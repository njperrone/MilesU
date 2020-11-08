//Enums and Globals

function main(){
    // Flow control

    // get form data
    let num1 = document.getElementById("number-1").value;
    let num2 = document.getElementById("number-2").value;
    let operation = document.querySelector('input[name="operation"]:checked').value;
    let result;
    let opSymbol;

    // console.log(`number 1: ${num1}. number 2: ${num2}`);
    // console.log(operation);

    //verify inputs

    // choose the right function
    switch (operation){
        case "add":
            result = addNums(num1, num2);
            opSymbol = "+";
            break;
        case "subtract":
            result = subtractNums(num1, num2);
            opSymbol = "-";
            break;
        case "multiply":
            result = multiply(num1, num2);
            opSymbol = "*";
            break;
        case "divide":
            result = divide(num1, num2);
            opSymbol = "/"
            break;
    }

    //adjust the reports.
    document.getElementById("results").innerHTML = `${num1} ${opSymbol} ${num2} = ${result}`;
}

function clearForm(){
    //Clears forms and resets radio
    document.getElementById("calculator").reset();
    document.getElementById("number-1").focus();
}

function addNums(a,b){
    return Number(a) + Number(b);
    // Adds numbers
}

function subtractNums(a,b){
    // Subtracts numbers
    return a-b;
}

function multiply(a,b){
    //Multiplies numbers
    return a*b;
}

function divide(a,b){
    //Divides numbers
    if (b == 0){
        // probably going to move this logic elsewhere
        return "You cannot divide by ZERO."
    } else{
        return a/b;
    }
}
