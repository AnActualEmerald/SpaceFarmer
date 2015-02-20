package net.burrito.entities.mobs 
{
	import flash.display.BitmapData;
	import flash.media.Sound;
	import flash.text.engine.TypographicCase;
	import net.burrito.client.Main;
	import net.burrito.levels.Level;
	import net.burrito.Utils.Assets;
	/**
	 * ...
	 * @author ...
	 */
	public class Bullet extends Mob 
	{
		
		public static var width:int = 16;
		public static var height:int = 16;
		private static var ded:Sound = Assets.DED;
		
		
		public function Bullet(x:int, y:int, lev:Level) 
		{
			super(x, y, new BitmapData(width, height, false, 0xF2FF00));
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
				
				if (m != this && m != Main.me && !(m is Bullet))
					if (this.sprite.hitTest(this.point, 255, m.sprite, m.point, 255))
					{
						m.alive = false;
						this.alive = false;
						Main.points += 10;
						ded.play();
					}
			}
		}
		
	}

}