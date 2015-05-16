//The Odin Project Question 1

var sum = 0;

for (var i = 0; i < 1000; i++){
	if (i % 3 == 0){
		sum += i;
	} else if (i % 5 == 0){
		sum += i;
	}
}