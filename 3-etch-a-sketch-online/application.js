$(document).ready(function(){
	//Default grid block size and entering color
	var block_size = 70; 
	var color = "#000000";
	var grid_type = "norm";

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

	//Initial grid setup
	changeGrid(block_size);
	changeBSize(block_size);

	$(".grid_block").mouseenter(function(){
		if (grid_type === "norm"){
			color = "#000000";
		} else if (grid_type === 'rand') {
			color = randomColor();
		}
		$(this).css("background-color",color);
	});

	$(".button_reset").click(function(){
		$(".grid_block").css("background-color","#c19c64");
	});

	$(".button_rand").click(function(){
		grid_type = "rand";
	});
});