
extends Node2D

onready var dim = Vector2(50,50)
onready var perc=50
onready var mat=[]
onready var myseed = 20

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

func _ready():
	createMat()
	fillmat()
	printmat()



