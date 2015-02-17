package net.burrito.Utils 
{
	import flash.display.BitmapData;
	import flash.events.Event;
	import flash.geom.Point;
	import net.burrito.client.GUI.GasBar;
	import net.burrito.client.GUI.GUI;
	import net.burrito.client.Main;
	
	/**
	 * ...
	 * @author Burrito119
	 */
	public class BurritoUIManager 
	{
		
		public static var UIParts:Vector.<GUI> = new Vector.<GUI>;
		public static var Gas:GasBar = new GasBar(0, 0);
		private static var mouseX:int, mouseY:int;
		
		
		public function BurritoUIManager() 
		{
			
		}
		
		public static function add(part:GUI):void {
			UIParts.push(part);
		}
		
		public static function render(screen:BitmapData):void {
			for (var i:int = 0; i < UIParts.length; i++ ) {
				UIParts[i].render(screen);
			}
		}
		
		public static function clicked(e:Event):void {
			for (var i:int = 0; i < UIParts.length; i++ ) {
				if (Main.mouse.hitTest(
					new Point(mouseX, mouseY), 255, UIParts[i].look, UIParts[i].point, 255))
				{
					UIParts[i].clicked();
				}
			}
		}
		
		public static function tick(mouseX:int, mouseY:int):void {
			mouseX = mouseX;
			mouseY = mouseY;
		}
		
	}

}