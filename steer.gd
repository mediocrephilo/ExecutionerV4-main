extends Node

const DEFAULT_MASS = 2.0
const DEFAULT_MAX_SPEED = 400.0

static func follow (velocity: Vector2, globalpos: Vector2, targetpos: Vector2, 
speed: =DEFAULT_MAX_SPEED, mass:= DEFAULT_MASS) -> Vector2:
	
	var desiredvelocity = (targetpos - globalpos).normalized() * speed
	var newVelocity: = Vector2.ZERO
	return (velocity )
