package scripts;

import com.stencyl.graphics.G;
import com.stencyl.graphics.BitmapWrapper;

import com.stencyl.behavior.Script;
import com.stencyl.behavior.Script.*;
import com.stencyl.behavior.ActorScript;
import com.stencyl.behavior.SceneScript;
import com.stencyl.behavior.TimedTask;

import com.stencyl.models.Actor;
import com.stencyl.models.GameModel;
import com.stencyl.models.actor.Animation;
import com.stencyl.models.actor.ActorType;
import com.stencyl.models.actor.Collision;
import com.stencyl.models.actor.Group;
import com.stencyl.models.Scene;
import com.stencyl.models.Sound;
import com.stencyl.models.Region;
import com.stencyl.models.Font;
import com.stencyl.models.Joystick;

import com.stencyl.Engine;
import com.stencyl.Input;
import com.stencyl.Key;
import com.stencyl.utils.Utils;

import openfl.ui.Mouse;
import openfl.display.Graphics;
import openfl.display.BlendMode;
import openfl.display.BitmapData;
import openfl.display.Bitmap;
import openfl.events.Event;
import openfl.events.KeyboardEvent;
import openfl.events.TouchEvent;
import openfl.net.URLLoader;

import box2D.common.math.B2Vec2;
import box2D.dynamics.B2Body;
import box2D.dynamics.B2Fixture;
import box2D.dynamics.joints.B2Joint;

import motion.Actuate;
import motion.easing.Back;
import motion.easing.Cubic;
import motion.easing.Elastic;
import motion.easing.Expo;
import motion.easing.Linear;
import motion.easing.Quad;
import motion.easing.Quart;
import motion.easing.Quint;
import motion.easing.Sine;

import com.stencyl.graphics.shaders.BasicShader;
import com.stencyl.graphics.shaders.GrayscaleShader;
import com.stencyl.graphics.shaders.SepiaShader;
import com.stencyl.graphics.shaders.InvertShader;
import com.stencyl.graphics.shaders.GrainShader;
import com.stencyl.graphics.shaders.ExternalShader;
import com.stencyl.graphics.shaders.InlineShader;
import com.stencyl.graphics.shaders.BlurShader;
import com.stencyl.graphics.shaders.SharpenShader;
import com.stencyl.graphics.shaders.ScanlineShader;
import com.stencyl.graphics.shaders.CSBShader;
import com.stencyl.graphics.shaders.HueShader;
import com.stencyl.graphics.shaders.TintShader;
import com.stencyl.graphics.shaders.BloomShader;



class ActorEvents_44 extends ActorScript
{
	public var _Health:Float;
	public var _EnemyCopy:ActorType;
	public var _FlashingLight:String;
	public var _Left:String;
	public var _2:Scene;
	public var _22:Region;
	
	
	public function new(dummy:Int, actor:Actor, dummy2:Engine)
	{
		super(actor);
		nameMap.set("Health", "_Health");
		_Health = 0.0;
		nameMap.set("Enemy Copy", "_EnemyCopy");
		nameMap.set("Flashing Light", "_FlashingLight");
		nameMap.set("Left", "_Left");
		nameMap.set("2", "_2");
		nameMap.set("22", "_22");
		
	}
	
	override public function init()
	{
		
		/* ======================== When Updating ========================= */
		addWhenUpdatedListener(null, function(elapsedTime:Float, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				if(isKeyDown("down"))
				{
					actor.setXVelocity(0);
					actor.setAnimation("" + "Walking Backward");
					actor.setBlendMode(BlendMode.DARKEN);
				}
				else if(isKeyDown("left"))
				{
					actor.setBlendMode(BlendMode.NORMAL);
					actor.setXVelocity(-8);
					actor.setAnimation("" + "Walk Left");
					actor.applyImpulseInDirection(180, .2);
				}
				else if(isKeyDown("right"))
				{
					actor.setBlendMode(BlendMode.NORMAL);
					actor.setXVelocity(8);
					actor.setAnimation("" + "Walk Right");
					actor.applyImpulseInDirection(180, -.2);
				}
				else if(isKeyDown("up"))
				{
					actor.setXVelocity(0);
					actor.setAnimation("" + "Walking Forward");
					actor.setBlendMode(BlendMode.DARKEN);
				}
			}
		});
		
		/* ======================== When Updating ========================= */
		addWhenUpdatedListener(null, function(elapsedTime:Float, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				if((actor.getScreenX() <= -2))
				{
					actor.applyImpulseInDirection(180, -1);
				}
				else if((actor.getScreenX() >= 720))
				{
					actor.applyImpulseInDirection(180, 1);
				}
			}
		});
		
		/* ======================== When Updating ========================= */
		addWhenUpdatedListener(null, function(elapsedTime:Float, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				if(((actor.getScreenX() >= 647) && (actor.getAnimation() == "Walking Forward")))
				{
					switchScene(GameModel.get().scenes.get(1).getID(), null, createCrossfadeTransition(1));
				}
			}
		});
		
		/* ======================== When Updating ========================= */
		addWhenUpdatedListener(null, function(elapsedTime:Float, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				if(isKeyDown(_Left))
				{
					actor.pushInDirection(-90, 10);
				}
			}
		});
		
	}
	
	override public function forwardMessage(msg:String)
	{
		
	}
}