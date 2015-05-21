//Default grid block size and entering color
var block_size = 14; 
var color = "#000000";
var state = "norm";

$(document).ready(function(){
	//Initial grid setup
	changeGrid(block_size);
	changeBSize(block_size);
	play();
});

var changeGrid = function(block_size){
	var rel_size = Math.floor(700/((block_size)));

	for (var i = 0; i < rel_size; i++){
		for (var j = 0; j < rel_size; j++){
			$(".grid").append('<div class="grid_block"></div>');
		}
	}
}

var changeBSize = function(block_size){
	var block_size_str = block_size + "px";
	$(".grid_block").css("width", block_size_str);
	$(".grid_block").css("height", block_size_str);
}

var randomColor = function(){
	var bit = "0123456789ABCDEF".split("");
	var color = '#';
	for(var i =0; i < 6; i++){
		//Math.random() gets a value from 0 to 1
		color += bit[Math.floor(Math.random()*16)];
	}
	return color;
}

//New size will be a divisor of 700, or rounded down to the closest
var newGrid = function(){
	var new_size = prompt("Enter the size of the grid (1 - 100):");
	if (isNaN(new_size)){
		alert("You did not input a number");
	} else {
		if ((new_size > 0) && (new_size <= 100)){
			$(".grid").empty();
			block_size = 700/new_size;
			changeGrid(block_size);
			changeBSize(block_size);
			// play();
		} else {
			alert("Number out of range!");
		}
	}
}

var play = function(){
	$(".grid").on('mouseenter', ".grid_block", function(){
		if (state === "norm"){
			color = "#000000";
			$(this).css("background-color",color);
		} else if (state === 'rand') {
			color = randomColor();
			$(this).css("background-color",color);
		} else if (state === 'trail'){
			$(this).css("opacity","0");
			$(this).fadeTo(600,1);
		}
	});

	$(".buttons").on('click', ".button_reset", function(){
		$(".grid_block").css("background-color","#ffffff");
	});

	$(".buttons").on('click', ".button_norm", function(){
		$(".grid_block").css("background-color","#ffffff");
		state = "norm";
		newGrid();
	});

	$(".buttons").on('click', ".button_rand", function(){
		$(".grid_block").css("background-color","#ffffff");
		state = "rand";
		newGrid();
	});

	$(".buttons").on('click', ".button_trail", function(){
		$(".grid_block").css("background-color","#ffffff");
		state = "trail";
		newGrid();
	});
}