
extends Node2D

onready var dim = Vector2(50,50)
onready var perc=50
onready var mat=[]
onready var myseed = 20
onready var currentScene = get_tree().get_root().get_child(get_tree().get_root().get_child_count() -1)


func printmat():
	for i in range(mat.size()):
		print(mat[i])

func createMat():
	for i in range(dim.x):
		mat.append([])
		for j in range(dim.y):
			mat[i].append(null)

func matset(x,y,val):
	mat[y][x] = val

func fillmat():
	seed(myseed)
	for i in range(dim.x):
		for j in range(dim.y):
			if(rand_range(0,100) < 50):
				matset(i,j,0)
			else:
				matset(i,j,1)

func draw():
	var scene = ResourceLoader.load("res://tile.scn")
	for i in range(dim.x):
		for j in range(dim.y):
			var tile = scene.instance()
			tile.set_pos(Vector2(i*11,j*11))
			add_child(tile)
			
	print(get_child_count())
	
	

	
	
func _ready():
	createMat()
	fillmat()
	#printmat()
	draw()



