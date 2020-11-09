let fruits = ['apple', 'oragne', 'soup'];

console.log(fruits.length);

// fruits.push("pear");
// fruits.pop(); // remove last item

fruits.forEach(function(item, index, array){
    if (array.length === 3){
    array.pop();
    }
    console.log("This ", item," is a fruit in the ", index, " basket.");
});

fruits.shift(); //removes first object in array

fruits.unshift('apple'); //adds item to first spot

// console.log(fruits[22]);


let num = 15;

if ( num>0 && num< 10 || num>02 && num<30){
    console.log(true);
} else {
    console.log(false);
}