extends CanvasLayer

@onready var ver = $ver
@onready var fps = $fps
@onready var info = $info
var buildNum = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	GetBuildNumber()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func GetBuildNumber():
	$GH.request("https://api.github.com/repos/VizzyPop-GH/GimmeDevRole-Game/contributors")

func _on_gh_request_completed(result, response_code, headers, body):

	var thej = body.get_string_from_utf8().replace("\\", "") # we dont like these
	thej = thej.replace("[", "") # we dont like these
	thej = thej.replace("]", "") # we dont like these
	var jsonParser = JSON.new() # create json parser
	var error = jsonParser.parse(thej) # parse the stuff github sends us back
	var parsed = jsonParser.get_data() # get the parsed data
	if thej.contains("contributions"):
		buildNum = parsed.contributions # grab the commit number
		ver.text = "Mesa Labs "+ Main.version +"@" + Main.branch+  " (b" + str(buildNum) + ")" # shove it on da text
		
	else:
		print("WARN: Unable to get build number")
		ver.text = Main.version # shove it on da text
