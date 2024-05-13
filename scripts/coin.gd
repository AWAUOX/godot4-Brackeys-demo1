extends Area2D
 
@onready var game_manager = %GameManager  #注意百分号是独一无二的节点
@onready var animation_player = $AnimationPlayer

## Called when the node enters the scene tree for the first time.
#func _ready():
	##pass # Replace with function body.
	#print("i'm a coin")
#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass




func _on_body_entered(body):
	print("get a coin! ") 
	game_manager.Count_Score()
	animation_player.play("new_animation_pickup")
	
	#queue_free()  #在场景中释放硬币
