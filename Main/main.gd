extends Node

@export var coin_scene: PackedScene
@export var playtime = 30
var level = 1
var score = 0
var time_left = 0
var screensize = Vector2.ZERO
var playing = false

func _ready() -> void:
	screensize = get_viewport().get_visible_rect().size
	$Player.screensize = screensize
	$Player.hide()
	new_game()

func _process(delta: float) -> void:
	if playing and get_tree().get_nodes_in_group("coins").size() == 0:
		level += 1
		time_left += 5
		spawn_coins()
	

func new_game():
	playing = true
	level = 1
	score = 0
	time_left = playtime
	$Player.start()
	$Player.show()
	$GameTimer.start()
	spawn_coins()
	
func spawn_coins():
	for i in level + 4:
		var new_coin = coin_scene.instantiate()
		add_child(new_coin)
		new_coin.position = Vector2(randi_range(0, screensize.x), randi_range(0, screensize.y) )
		

		
		
		
