extends CharacterBody2D


const SPEED = 150.0
const JUMP_VELOCITY = -280.0

@onready var animated_sprite_2d = $AnimatedSprite2D


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")



func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	
	#获取输入方向direction  -1，0，1
	var direction = Input.get_axis("move_left", "move_right")
	
	if direction > 0:
		animated_sprite_2d.flip_h = false  #翻转图像？
	if direction < 0:
		animated_sprite_2d.flip_h = true #翻转图像！
	
	#播放状态动画
	if is_on_floor():
		if direction == 0:
			animated_sprite_2d.play("idle")
		else :
			animated_sprite_2d.play("animation_running")
	else :
		animated_sprite_2d.play("animation_jumping")

		
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
