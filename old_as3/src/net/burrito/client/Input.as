package net.burrito.client 
{
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.ui.Mouse;
	/**
	 * ...
	 * @author Burrito119
	 */
	public class Input 
	{
		
		public static function keyPressed(e:KeyboardEvent):void {
			var keyCode:int = e.keyCode;
			if (keyCode < 0 || keyCode > 255) return;
			
			keysDown[keyCode] = true;
			
		}
		
		public static function keyRelesed(e:KeyboardEvent):void {
			var keyCode:int = e.keyCode;
			if (keyCode < 0 || keyCode > 255) return;
			
			keysDown[keyCode] = false;
		}
		
		public static function isKeyDown(keyCode:int):Boolean {
			if (keyCode < 0 || keyCode > 255) return false;
			return keysDown[keyCode];
		}
		
		private static var keysDown:Vector.<Boolean> = new Vector.<Boolean>(256);
	}

}