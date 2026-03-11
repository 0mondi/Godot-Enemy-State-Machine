extends CharacterBody2D

enum State { IDLE, PATROL, CHASE, ATTACK }
var current_state: State = State.IDLE

func _physics_process(delta):
	# State Machine Logic Router
	match current_state:
		State.IDLE:
			process_idle()
		State.PATROL:
			process_patrol(delta)
		State.CHASE:
			process_chase(delta)
		State.ATTACK:
			process_attack()

func process_idle():
	velocity = Vector2.ZERO
	# Wait for player detection trigger...

func process_patrol(_delta):
	# Logic to move between waypoints
	pass

func process_chase(_delta):
	# Logic to move toward player coordinates
	pass

func process_attack():
	# Trigger attack animation and hitbox
	pass
