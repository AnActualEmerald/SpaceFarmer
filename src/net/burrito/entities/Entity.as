package net.burrito.entities 
{
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import net.burrito.Utils.*;
	import net.burrito.client.*;
	/**
	 * ...
	 * @author Burrito119
	 */
	public class Entity 
	{
		public var x:int, y:int;
		public var sprite:BitmapData;
		public var w:int, h:int;
		public var point:Point;
		
		public function Entity(x:int, y:int, sprite:BitmapData) 
		{
			this.x = x;
			this.y = y;
			this.sprite = sprite;
			this.w = sprite.width;
			this.h = sprite.height;
			
			point = new Point(x, y);
		}
		
		public function render(screen:BitmapData, cam:Rectangle):void {
			if (cam == null) cam = sprite.rect;
			screen.copyPixels(sprite, cam, this.point);
		}
		
		public function tick():void {
			
		}
		
		
	}

}