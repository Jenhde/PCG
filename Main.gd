
extends Node2D

onready var dim = Vector2(50,50)
onready var perc=50
onready var mat=[]
onready var myseed = 40
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
	
func matget(x,y):
	return mat[y][x]
	
func fillmat():
	seed(myseed)
	for i in range(dim.x):
		for j in range(dim.y):
			if(i==0||j==0||i==dim.x-1||j==dim.y-1):
				matset(i,j,1)
			else:
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
			if(matget(i,j)==0):
				tile.set_color(Color(1,1,1))
			else:
				tile.set_color(Color(0,0,0))
			add_child(tile)
			
	print(get_child_count())
	
func vecinos(x,y):
	var cantvecinos = 0
	for i in [x-1,x,x+1]:
		for j in [y-1,y,y+1]: 
			if(i>=0 && i<dim.x && j>=0 && j<dim.y):
				if(x==i and y==j):
					continue
				else:
					if(matget(i,j) == 1):
						cantvecinos = cantvecinos +1;
	return cantvecinos
func suavizar():
	for i in range(dim.x):
		for j in range(dim.y):
			var cantmuros = vecinos(i,j)
			if(cantmuros > 4):
				matset(i,j,1)
			else:
				matset(i,j,0)
func z(x,y):
	for i in [x,x-1,x+1]:
		print(i)
func _ready():
	createMat()
	fillmat()
	#printmat()
	suavizar()
	draw()
	print(vecinos(0,0))
	



