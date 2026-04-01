extends Control

func _on_settings_exit_pressed() -> void:
	SceneLoader.go_back()  # Returns to previous scene
