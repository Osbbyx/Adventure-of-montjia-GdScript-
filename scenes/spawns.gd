extends Node

var lista_arboles = []
export (float) var offset_x
export (int) var max_y #max y min de los arboles
export (int) var min_y

func _ready():
	randomize()# semilla para numeros aleatorios
	lista_arboles = get_tree().get_nodes_in_group("tubo")# obtengo los spawn
	for i in lista_arboles:
		azar_y(i)
	
	
func reposicionar():# al tubo que sale se pone al final
	lista_arboles[0].global_position.x = lista_arboles[-1].global_position.x + offset_x#posicionamos al final
	azar_y(lista_arboles[0]) #genero posicion y aleatoria
	lista_arboles.push_back(lista_arboles.pop_front())# sacamos el primer elemento y lo agregamos al final
	
	
	
func azar_y(var tubo): #posiciono los tubos aleatoriamente
	tubo.global_position.y = randi()%max_y+min_y# max y minimo que puede tener