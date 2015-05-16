//The Odin Project Question 2

var sum = 0;
var fib_val_prev = 1;
var fib_val_cur = 2;

while (fib_val_cur < 1000000){
	if (fib_val_cur % 2 == 0){
		sum += fib_val_cur;
	}
	var temp = fib_val_prev;
	fib_val_prev = fib_val_cur;
	fib_val_cur = temp + fib_val_cur;
}