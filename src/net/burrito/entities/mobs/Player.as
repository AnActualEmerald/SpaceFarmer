package net.burrito.entities.mobs 
{
	
	import flash.display.BitmapData;
	import flash.media.Sound;
	import flash.media.SoundTransform;
	import net.burrito.Utils.*;
	import net.burrito.client.*;
	/**
	 * ...
	 * @author Burrito119
	 */
	public class Player extends Mob
	{
		public var levSpeed:int = 4;
		public var fuel:int = 625;
		
		private var shoot_sound:Sound = Assets.PEW;
		
		public function Player(x:int, y:int, sprite:BitmapData) 
		{
			super(x, y, sprite);
			
		}
		
		override public function tick():void {
			entCollide();
			move();
			points();
			BurritoUIManager.Gas.amount = fuel;
		}
		
		public function points():void {
			if(lev.id % 2 == 0)
				Main.points++;
		}
		
		public function kill():void {
			alive = false;
		}
		
		public function entCollide():void {
			for ( var i:int = 0; i < lev.enemies.length; i++ ) {
				var en:Mob = lev.enemies[i];
				if (en.sprite.hitTest(en.point, 255, this.sprite, this.point, 255)) {
					this.kill();
				}
			}
		}
		
		private var hasFired:Boolean = false;
		
		override public function move():void {
			if (Input.isKeyDown(Key.D)) {
				this.point.x += this.speed;
				
			}
			if (Input.isKeyDown(Key.A)) {
				this.point.x -= this.speed;
				
			}
			if (Input.isKeyDown(Key.S)) {
				if(point.y + this.sprite.height < Main.stageHeight)
					this.point.y += this.speed;
				
			}
			if (Input.isKeyDown(Key.W)) {
				if (point.y > 0)
					this.point.y -= this.speed;
				
			}
			
			if (Input.isKeyDown(Key.SPACE) && !hasFired) {
				if(!Main.no_sounds)
				shoot_sound.play();
				lev.addMob(new Bullet(this.point.x + sprite.width -  Bullet.width / 2, this.point.y + (sprite.height/2) + (Bullet.height / 2) - 3, lev));
				hasFired = true;
			}
			
			if (!Input.isKeyDown(Key.SPACE) && hasFired)
				hasFired = false;
			
			if (Input.isKeyDown(Key.SHIFT)) {
				if(this.fuel >= 30){
					this.speed = 10;
				}else {
					this.speed = 5;
				}
				if (this.fuel >= 0 ){
					this.fuel -= 2; 
				}
				
			}
			else {
				this.speed = 5;
				if (this.fuel < 625) {
					this.fuel += 2;
				}
			}
		}
		
	}

}