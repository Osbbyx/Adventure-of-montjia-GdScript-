extends Node
export (PackedScene) var juego


func _physics_process(delta):
	if(Input.is_action_just_pressed("click_izq")):
		get_tree().change_scene_to(juego)

