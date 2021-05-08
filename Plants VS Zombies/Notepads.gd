extends Control

func _ready():
	$File.get_popup().connect("id_pressed",self,"_file_id_press")
	$Help.get_popup().connect("id_pressed",self,"_help_id_press")
	$Opti.get_popup().connect("id_pressed",self,"_opti_id_press")

func _file_id_press(id):
	if id == 0 :
		$Open.popup()
		
	elif id == 1 :
		$Save.popup()
	
	elif id == 2 :
		get_tree().quit()
		
	

func _opti_id_press(id):
	if id == 0:
		if OS.window_borderless == false:
			$notepads.show()
			OS.set_borderless_window(true)
			OS.center_window()
		else:
			$notepads.hide()
			OS.set_borderless_window(false)
			OS.center_window()

func _help_id_press(id):
	if id == 0:
		$About.popup()


func _on_Open_file_selected(path):
	var file = File.new()
	file.open(path,file.READ)
	$Edit.text = file.get_as_text()
	file.close()
	


func _on_Save_file_selected(path):
	var file = File.new()
	file.open(path + ".txt",File.WRITE)
	file.store_string($Edit.text)
	file.close()


func _on_Button_pressed():
	OS.shell_open("https://github.com/ErrorDreemurr/Plants-VS-Zombies-NotePads")
