var number = 1000;
var largest_prime = 1;

for (var i = 2; i < number; i++){
	if (number % i == 0){
		//Check if i is a prime number
		var isPrime = true;
		for (var j = 2; j < i; j++){
			if (i % j == 0){
				isPrime = false;
				break;
			}
		}
		if (isPrime){
			largest_prime = i;
		}
	}
}