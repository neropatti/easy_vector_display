extends Node2D

@export var target : NodePath
@export var target_property : String
@export var vector_scale : float = 1

var target_node = null

var b : Vector2 = Vector2.ZERO

func _draw():
	draw_line(Vector2(0,0), Vector2(b.x,0) * vector_scale, Color(0,0,1), 2, true)
	draw_line(Vector2(0,0), Vector2(0,b.y) * vector_scale, Color(1,0,0), 2, true)
	draw_line(Vector2(0,0), b * vector_scale, Color(0.9,0,0.9), 2, true)

func _ready():
	target_node = get_node(target)

func _physics_process(delta):
	b = target_node.get(target_property)
	queue_redraw()

func _unhandled_key_input(event):
	if event.keycode == KEY_V and event.pressed:
		self.visible = !self.visible
