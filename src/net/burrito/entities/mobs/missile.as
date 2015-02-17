package net.burrito.entities.mobs 
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import net.burrito.Utils.Assets;
	
	/**
	 * ...
	 * @author Burrito119
	 */
	public class missile extends Mob 
	{
		
		public function missile(x:int, y:int, sprite:BitmapData)
		{
			
			super(x, y, sprite);
		}
		
		override public function tick():void {
			move();
		}
		
		override public function move():void {
			this.point.x -= speed;

		}
		
	}

}