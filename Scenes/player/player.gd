extends CharacterBody2D
class_name player

@export var max_speed := 180.0
@export var jump_force := 450.0
@export var max_jumps := 2
@export var gravity := 1600.0

@onready var visuals: Node2D = $Visuals
@onready var anim_sprite: AnimatedSprite2D = %AnimatedSprite2D
@onready var ray_cast: RayCast2D = %RayCast2D
