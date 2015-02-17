package net.burrito.terrain 
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import net.burrito.Utils.Assets;
	
	/**
	 * ...
	 * @author Burrito119
	 */
	public class groundBasic extends Terrain
	{
		public static var id:int = 0;
		
		public function groundBasic(x:int, y:int) 
		{
			super(x, y);
			this.width = getSprite().width;
			this.height = getSprite().height;
		}
		
		override public function solid():Boolean {
			return true;
		}
		
		override public function getSprite():BitmapData {
			return Assets.WATER_TILE;
		}
		
	}

}