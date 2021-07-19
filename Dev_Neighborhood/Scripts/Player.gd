
extends AnimatedSprite

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2()
	
	if Input.is_key_pressed(KEY_W):
		velocity.y = -1
	elif Input.is_key_pressed(KEY_S):
		velocity.y = 1
	elif Input.is_key_pressed(KEY_A):
		velocity.x = -1
	elif Input.is_key_pressed(KEY_D):
		velocity.x = 1 
	self.position = self.position + velocity*delta*200
	self.Update_Animation(velocity)

func Update_Animation(velocity):
		if velocity.y == -1:
			self.play("Walk_Up")
		elif velocity.y == 1:
			self.play("Walk_Down")
		elif velocity.x == -1:
			self.play("Walk_Left")
		elif velocity.x == 1:
			self.play("Walk_Rigth")
		if velocity == Vector2():
			if self.animation == 'Walk_Down':
				self.play("Stand_Down")
			elif self.animation == 'Walk_Up':
				self.play("Stand_Up")
			if self.animation == 'Walk_Left':
				self.play("Stand_Left")
			if self.animation == 'Walk_Rigth':
				self.play("Stand_Rigth")