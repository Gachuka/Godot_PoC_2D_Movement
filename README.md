# Godot PoC - 2D Movement
This repository contains the bare bones for basic 2d player movement in Godot

## Player
The player scene comprises of 3 child nodes
- AnimatedSprite2D
- CollisionShape2D
- AnimationPlayer

### AnimatedSprite2D
Node that contains the sprites and frames for each animation.

### CollisionShape2D
Node to establish player hitbox/collision box.

### AnimationPlayer
Node that contains the animation timing that is linked to AnimatedSprite2D.

### player.gd
Script file used for the assigned scene, in this case, the player. Player movement is controlled with the arrow keys.

## Asset used
Pixel art used in this PoC is the free portion of the Hana Caraka Base Character asset pack that can be found [here](https://otterisk.itch.io/hana-caraka-base-character)

## Version Control
Godot uses git plugin to aide with version control onto GitHub, usage instructions can be found in the following link: [godot-git-plugin/Git-plugin-v3](https://github.com/godotengine/godot-git-plugin/wiki/Git-plugin-v3)
