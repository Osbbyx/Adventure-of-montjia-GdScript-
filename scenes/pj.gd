extends RigidBody2D

export (float) var impulso
export (float) var velocidad_desplazamiento
export(float) var velocidad_incrementar

var vivo = true

func _ready():
	pass
	
func _physics_process(delta):
	linear_velocity.x = velocidad_desplazamiento#viaja a la velocidad de desplazamiento en horizontal
	if(Input.is_action_just_pressed("click_izq")):#si presionamos click izq se levanta el pj
		set_linear_velocity(Vector2(0,0))
		get_node("AnimationPlayer").play("aleteo")
		linear_velocity.y -= impulso#subimos con velocidad de impulso hacia arriba
		get_tree().get_nodes_in_group("sfx")[0].get_node("02").play()
	get_tree().get_nodes_in_group("limites_body")[0].global_position.x = global_position.x
	
func _integrate_forces(state):
	if(vivo):
		for i in range(state.get_contact_count()):
			if(state.get_contact_collider_object(i).is_in_group("tubin")):
				get_tree().get_nodes_in_group("sfx")[0].get_node("03").play()
				get_tree().get_nodes_in_group("main")[0].perdio() 
				velocidad_desplazamiento = 0
				vivo = false
	