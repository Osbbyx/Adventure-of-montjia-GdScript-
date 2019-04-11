extends Position2D



func _ready():
	pass



func _on_VisibilityNotifier2D_screen_exited():#al salir el arbol de pantalla va hacia el final
	get_tree().get_nodes_in_group("spawn_cube")[0].reposicionar()


func _on_Area2D_body_entered(body):
	if(body.is_in_group("personaje")):
		get_tree().get_nodes_in_group("sfx")[0].get_node("01").play()
		get_tree().get_nodes_in_group("main")[0].agregar_punto()
