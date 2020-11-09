//Enums and Globals
const originalMessage = document.getElementById("results").innerHTML;
function main(){
    // Flow control

    // get form data
    let num1 = document.getElementById("number-1").value;
    let num2 = document.getElementById("number-2").value;
    let operation = document.querySelector('input[name="operation"]:checked').value;
    

    // console.log(`number 1: ${num1}. number 2: ${num2}`);
    // console.log(operation);
debugger;
    //verify inputs
    if (num1 === "" || num2 === ""){
        document.getElementById("results").innerHTML = "Please enter valid numbers."
    } 
    else{
        
        // choose the right function
        switch (operation){
            case "add":
                addNums(num1, num2);
                break;
            case "subtract":
                subtractNums(num1, num2);
                break;
            case "multiply":
                multiply(num1, num2);
                break;
            case "divide":
                divide(num1, num2);
                break;
        }
                        
    }
    //adjust the reports.    
}
                    
function clearForm(){
    //Clears forms and resets radio
    document.getElementById("calculator").reset();
    document.getElementById("first-num").focus();
    document.getElementById("results").innerHTML = originalMessage;
}

function addNums(a,b){
    let x = Number(a) + Number(b);

    document.getElementById("results").innerHTML = `${b} + ${a} = ${x}`;

    // Adds numbers
}

function subtractNums(a,b){
    // Subtracts numbers
    let x = a-b;

    document.getElementById("results").innerHTML = `${b} - ${a} = ${x}`;
}

function multiply(a,b){
    //Multiplies numbers
    let x = a*b;

    document.getElementById("results").innerHTML = `${b} * ${a} = ${x}`;
}

function divide(a,b){
    //Divides numbers
    if (b == 0){
        // probably going to move this logic elsewhere
        document.getElementById("results").innerHTML = `You cannot divide by ZERO!`;
    } else{
        let x = a/b;

        document.getElementById("results").innerHTML = `${a} / ${b} = ${x}`;
    }
}
