package net.burrito.entities.mobs 
{
	import flash.display.BitmapData;
	import net.burrito.levels.Level;
	/**
	 * ...
	 * @author ...
	 */
	public class Bullet extends Mob 
	{
		
		public function Bullet(x:int, y:int, lev:Level) 
		{
			super(x, y, new BitmapData(16, 16, false, 0xF2FF00));
			this.speed *= 2;
		}
		
		override public function move():void 
		{
			this.point.x += speed;
		}
		
		override public function tick():void
		{
			move();
			if (this.point.x >= lev.bitmapData.width)
				this.alive = false;
			
			for (var i:int = 0; i < lev.enemies.length; i++)
			{
				var m:Mob = lev.enemies[i];
				if (m != this && m != lev.player && typeof(m) != "Bullet")
					if (this.sprite.hitTest(this.point, 255, m.sprite, m.point, 255))
					{
						m.alive = false;
					}
			}
		}
		
	}

}