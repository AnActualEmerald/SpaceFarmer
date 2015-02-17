package net.burrito.terrain 
{
	import flash.display.BitmapData;
	import net.burrito.Utils.Assets;
	/**
	 * ...
	 * @author Burrito119
	 */
	public class goalBasic extends Terrain
	{
		public static var id:int = 2;
		
		public function goalBasic(x:int, y:int) 
		{
			super(x, y);
			goal = true;
		}
		
		override public function getSprite():BitmapData {
			return Assets.GRASS_TILE;
		}
		
	}

}