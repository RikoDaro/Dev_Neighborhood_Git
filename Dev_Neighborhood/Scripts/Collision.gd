extends KinematicBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2()
	
	if Input.is_key_pressed(KEY_W):
		velocity.y = -1
		$RayCast2D.cast_to = Vector2(0,-50)
	elif Input.is_key_pressed(KEY_S):
		velocity.y = 1
		$RayCast2D.cast_to = Vector2(0,50)
	elif Input.is_key_pressed(KEY_A):
		velocity.x = -1
		$RayCast2D.cast_to = Vector2(-50,0)
	elif Input.is_key_pressed(KEY_D):
		velocity.x = 1 
		$RayCast2D.cast_to = Vector2(50,0)
	if (Input.is_action_just_released("ui_cancel")):
		emit_signal("pause")
		$Player.stop()
		set_process(false)
	var movement = 200*velocity*delta
	self.move_and_collide(movement)
	self.Update_Animation(velocity)
	
	
	if $RayCast2D.is_colliding():
		var collider = $RayCast2D.get_collider()
		if collider != null and Input.is_action_just_released("ui_accept") and "NPC" in collider.name:
			emit_signal("dialogue_started",collider.dialogue_text)
			$Player.stop()
			set_process(false)


func Update_Animation(velocity):
		if velocity.y == -1:
			$Player.play("Walk_Up")
		elif velocity.y == 1:
			$Player.play("Walk_Down")
		elif velocity.x == -1:
			$Player.play("Walk_Left")
		elif velocity.x == 1:
			$Player.play("Walk_Rigth")
		if velocity == Vector2():
			if $Player.animation == 'Walk_Down':
				$Player.play("Stand_Down")
			elif $Player.animation == 'Walk_Up':
				$Player.play("Stand_Up")
			elif $Player.animation == 'Walk_Left':
				$Player.play("Stand_Left")
			elif $Player.animation == 'Walk_Rigth':
				$Player.play("Stand_Rigth")