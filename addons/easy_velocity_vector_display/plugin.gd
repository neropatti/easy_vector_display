tool
extends EditorPlugin

func _enter_tree():
	add_custom_type("VectorDisplay2D", "Node2D", preload("vectordisplay2D.gd"), preload("icon.svg"))


func _exit_tree():
	remove_custom_type("VectorDisplay2D")
