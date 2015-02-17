package net.burrito.entities.mobs 
{
	import net.burrito.entities.Entity;
	import flash.display.BitmapData;
	import net.burrito.levels.Level;
	import net.burrito.client.Main;
	/**
	 * ...
	 * @author Burrito119
	 */
	public class Mob extends Entity
	{
		public var speed:int = 5;
		public var dir:int = 0;
		public var lev:Level;
		public var alive:Boolean = true;
		
		public function Mob(x:int, y:int, sprite:BitmapData) 
		{
			super(x, y, sprite);
			lev = Main.lev;
		}
		
		public function move():void {
			
		}
		
		public function setSpeed(speed:int):void {
			this.speed = speed;
		}
		
	}

}