package net.burrito.client.GUI 
{
	import flash.display.BitmapData;
	import flash.geom.Point;
	import net.burrito.Utils.BurritoUIManager;
	import net.burrito.Utils.Assets;
	/**
	 * ...
	 * @author Burrito119
	 */
	public class GUI 
	{
		
		public var point:Point;
		public var look:BitmapData;
		
		public function GUI(x:int, y:int, look:BitmapData) 
		{
			this.look = look;
			this.point = new Point(x, y);
		}
		
		public function render(screen:BitmapData):void {
			screen.copyPixels(look, look.rect, point, null, null, true);
		}
		
		public function clicked():void {
			Assets.WATER_TILE;
		}
		
		public function mouseEnter():void {
			
		}
		
		public function mouseExit():void {
			
		}
		
	}

}