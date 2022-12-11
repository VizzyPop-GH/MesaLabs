extends Node

var version = "0.0.0-dev"
var branch = "jellyfish"
var build = "b1"
var fps = 0

func updateBuild():
	pass
	
func _process(delta):
	fps = int(delta * 10000)
