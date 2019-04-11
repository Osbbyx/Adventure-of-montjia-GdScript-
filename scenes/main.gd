extends Node

var puntos = 0
var guar = 0


func _ready():
	pass
	
func agregar_punto():
	puntos+= 1
	get_tree().get_nodes_in_group("txt_puntos")[0].text = String(puntos)
	if(puntos % 10 == 0): # cada 10 tubos aumenta velocidad
		get_tree().get_nodes_in_group("personaje")[0].velocidad_desplazamiento += get_tree().get_nodes_in_group("personaje")[0].velocidad_incrementar

func perdio():
	if (puntos > guar):

		guar = puntos
	get_tree().get_nodes_in_group("winlose")[0].text = "GAME OVER"+"\nPoints: "+ String(puntos)
	get_tree().get_nodes_in_group("winlose")[1].text = "High Score: "+ String(guar)
	yield(get_tree().create_timer(4.0), "timeout")
	get_tree().reload_current_scene()


