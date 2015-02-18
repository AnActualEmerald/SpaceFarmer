package net.burrito.entities.mobs 
{
	
	import flash.display.BitmapData;
	import net.burrito.terrain.Terrain;
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
		
		override public function move():void {
			if (Input.isKeyDown(Key.D)) {
				this.point.x += this.speed;
				
			}
			if (Input.isKeyDown(Key.A)) {
				this.point.x -= this.speed;
				
			}
			if (Input.isKeyDown(Key.S)) {
				this.point.y += this.speed;
				
			}
			if (Input.isKeyDown(Key.W)) {
				this.point.y -= this.speed;
				
			}
			
			if (Input.isKeyDown(Key.SPACE)) {
				lev.addMob(new Bullet(this.point.x + 64, this.point.y, lev));
			}
			
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