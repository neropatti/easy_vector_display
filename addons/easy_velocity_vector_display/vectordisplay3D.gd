extends Spatial

export(NodePath) var target : NodePath
export(String) var target_property : String
export(float) var vector_scale : float = 1
export(float) var line_thickness : float = 1

var x
var y
var z
var xyz

var packed_lines = preload("lines.tscn")

var target_node = null

var b : Vector3 = Vector3.ZERO

func _ready():
	target_node = get_node(target)
	var lines = packed_lines.instance()
	x = lines.get_node("x")
	y = lines.get_node("y")
	z = lines.get_node("z")
	xyz = lines.get_node("xyz")
	add_child(lines)

func _physics_process(delta):
	b = target_node.get(target_property) * vector_scale
	
	x.scale = Vector3(b.x, line_thickness, line_thickness)
	x.translation = Vector3(b.x, 0, 0)
	y.scale = Vector3(line_thickness, b.y, line_thickness)
	y.translation = Vector3(0, b.y, 0)
	z.scale = Vector3(line_thickness, line_thickness, b.z)
	z.translation = Vector3(0, 0, b.z)
	
	xyz.scale = Vector3(line_thickness,line_thickness,b.length())
	
	xyz.look_at(b * 2, Vector3.UP)
	xyz.translation = b

func _unhandled_key_input(event):
	if event.scancode == KEY_V and event.pressed:
		self.visible = !self.visible
