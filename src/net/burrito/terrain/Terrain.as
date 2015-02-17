package net.burrito.terrain 
{
	import flash.display.BitmapData;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Burrito119
	 */
	public class Terrain 
	{
		public var x:int, y:int, m:int;
		public var sprite:BitmapData;
		public var width:int, height:int;
		public var p:Point;
		public var goal:Boolean = false;
		public static var id:int = 0;
		
		public function Terrain(x:int, y:int) 
		{
			this.x = x;
			this.y = y;
			
			p = new Point(x, y);
		}
		
		public function solid():Boolean {
			return true;
		}
		
		public function getSprite():BitmapData{
			return null;
		}
		
	}

}