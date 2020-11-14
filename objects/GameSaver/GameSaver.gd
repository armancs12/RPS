extends Node

const PERSISTABLE_GROUP_NAME = "Persistable"

const SAVE_DIR = "res://debug/saves" # Change it to user://saves in production
const SAVE_FILENAME = "save.data"

var savePath = SAVE_DIR.plus_file(SAVE_FILENAME)

func saveGame() -> void:
	var saveDir = Directory.new()
	if not saveDir.dir_exists(SAVE_DIR):
		saveDir.make_dir_recursive(SAVE_DIR)
	
	var saveFile = File.new()
	var error: int = saveFile.open(savePath, File.WRITE)
	if error:
		print("There was an error saving game. Error code: %d" % error)
		return
	var saveDict = getSaveDict()
	saveFile.store_var(saveDict)
	saveFile.close()
	
	print_debug(self.name + ": Save Game: " + str(saveDict))

func loadGame() -> void:
	var saveFile = File.new()
	if saveFile.file_exists(savePath):
		var error = saveFile.open(savePath, File.READ)
		if error:
			print("There was an error reading save file. Error code: %d" % error)
			return
		var saveDict: Dictionary = saveFile.get_var()
		saveFile.close()
		setSaveDict(saveDict)
		
		print_debug(self.name + ": Load Game: " + str(saveDict))


func getSaveDict() -> Dictionary:
	var saveDict: Dictionary = {
		"version": ProjectSettings.get("application/config/version")
	}
	for node in get_tree().get_nodes_in_group(PERSISTABLE_GROUP_NAME):
		if node.has_method("getProps"):
			saveDict[node.get_path()] = node.getProps()
	return saveDict

func setSaveDict(saveDict: Dictionary) -> void:
	for node in get_tree().get_nodes_in_group(PERSISTABLE_GROUP_NAME):
		if node.has_method("setProps"):
			if saveDict.has(node.get_path()):
				node.setProps(saveDict[node.get_path()])
