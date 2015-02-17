package net.burrito.terrain 
{
	import flash.display.BitmapData;
	import net.burrito.Utils.Assets;
	/**
	 * ...
	 * @author Burrito119
	 */
	public class slopeBasic extends Terrain
	{
		public static var id:int = 1;
		
		public function slopeBasic(x:int, y:int) 
		{
			super(x, y);
			this.width = getSprite().width;
			this.height = getSprite().height;
			m = this.height;
		}
		
		override public function solid():Boolean {
			return true;
		}
		
		override public function getSprite():BitmapData {
			return Assets.GRASS_TILE;
		}
		
	}

}