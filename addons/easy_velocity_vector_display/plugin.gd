tool
extends EditorPlugin

func _enter_tree():
	add_custom_type("VectorDisplay2D", "Node2D", preload("vectordisplay2D.gd"), preload("icon.svg"))
	add_custom_type("VectorDisplay3D", "Spatial", preload("vectordisplay3D.gd"), preload("icon.svg"))


func _exit_tree():
	remove_custom_type("VectorDisplay2D")
	remove_custom_type("VectorDisplay3D")
