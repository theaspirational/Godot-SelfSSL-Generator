extends Node


var cert_filename = "my-ss-ssl-Cert.crt"
var key_file_name = "my-ss-ssl-Key.key"

onready var path = "user://Cert/"

var CN = "FootballGame" # server name
var O = "TowerGames" # org name
var C = "UKR" # country iso 3166 code


func _ready() -> void:
	var D = Directory.new()
	if not D.dir_exists(path):
		D.make_dir(path)
	_create_cert()
	print("Cert created")


func _create_cert():
	var CNOC = "CN="+CN+",O="+O+",C="+C
	var crypto = Crypto.new()
	var key = crypto.generate_rsa(4096)
	var cert = crypto.generate_self_signed_certificate(key, CNOC)
	cert.save(path+cert_filename) 
	key.save(path+key_file_name)
