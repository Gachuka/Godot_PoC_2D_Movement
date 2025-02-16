using Godot;
using System;
using static Godot.TextServer;

public partial class player : CharacterBody2D
{
	private AnimatedSprite2D animated_sprite;
	private AnimationPlayer animations;

	public const float Speed = 50.0f;
	public const float RunningMultiplier = 1.5f;

	Vector2 movement_direction;
	public bool isRunning = false;

	public override void _Ready()
	{
		animated_sprite = GetNode<AnimatedSprite2D>("AnimatedSprite2D");
		animations = GetNode<AnimationPlayer>("AnimationPlayer");
	}
	public override void _PhysicsProcess(double delta)
	{
		movement_direction = Input.GetVector("ui_left", "ui_right", "ui_up", "ui_down");
		isRunning = Input.IsPhysicalKeyPressed(Key.Shift);
		if (movement_direction.Length() > 0)
		{
			movement_direction = movement_direction.Normalized();
		}
		Move(delta);
	}
	
	public void Move(double delta)
	{
		Vector2 velocity;
		if (movement_direction != Vector2.Zero)
		{
			velocity = movement_direction * Speed;
			//velocity.X = movement_direction.X * Speed;
			//velocity.Y = movement_direction.Y * Speed;
			if (isRunning)
			{
				velocity *= RunningMultiplier;
			}

			if (movement_direction.X > 0)
			{
				animated_sprite.FlipH = false;
				animations.Play(isRunning ? "run" : "walk");
			}
			else if(movement_direction.X < 0)
			{
				animated_sprite.FlipH = true;
				animations.Play(isRunning ? "run" : "walk");
			}
			else if (movement_direction.Y > 0)
			{
				animations.Play(isRunning ? "run_down" : "walk_down");
			}
			else if (movement_direction.Y < 0)
			{
				animations.Play(isRunning ? "run_up" : "walk_up");
			}
		}
		else
		{
			velocity = Vector2.Zero;
			//velocity.X = Mathf.MoveToward(Velocity.X, 0, Speed);
			//velocity.Y = Mathf.MoveToward(Velocity.Y, 0, Speed);
			animations.Play("idle");
		}
		Velocity = velocity;
		MoveAndSlide();
	}
}
