Godot 4 - Enemy AI Finite State Machine

## Overview
Game AI requires strict behavioral constraints. This repository demonstrates a scalable Finite State Machine (FSM) written purely in GDScript to handle NPC decision-making logic without relying on external plugins.

## Core Mechanics & Implementation
*   **State Enumeration:** Defines strict behavioral states using `enum State { IDLE, PATROL, CHASE, ATTACK }`. This prevents string-typing errors and allows for clean auto-completion in the editor.
*   **Logic Routing:** Utilizes Godot's `match` statement (similar to `switch-case` in C++) inside the `_physics_process()` loop to cleanly route execution only to the functions relevant to the active state.
*   **Modular Extensibility:** Because each behavior is isolated into its own function (e.g., `process_patrol()`), developers can easily inject pathfinding algorithms or raycast logic without breaking the overarching AI loop.

##  Technical Highlights
This FSM acts as a core behavioral skeleton. By updating the `current_state` variable dynamically upon detecting player distance or line-of-sight, the AI smoothly transitions from passive to aggressive states natively.

```gdscript
# Centralized Logic Router
func _physics_process(delta):
	match current_state:
		State.IDLE: process_idle()
		State.PATROL: process_patrol(delta)
		State.CHASE: process_chase(delta)
		State.ATTACK: process_attack()
