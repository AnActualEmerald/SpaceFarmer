package net.burrito.levels 
{
	import adobe.utils.ProductManager;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.geom.Point;
	import net.burrito.entities.mobs.Mob;
	import net.burrito.entities.mobs.Player;
	/**
	 * ...
	 * @author ...
	 */
	public class Level 
	{
		public var id:int;
		public var done:int = 0;
		public var enemies:Vector.<Mob> = new Vector.<Mob>;
		public var bitmapData:BitmapData = new BitmapData(8155, 1000);
		public var point:Point;
		public var LevX:int = 0;
		public var player:Player;
		
		public function Level(id:int) 
		{
			this.id = id;
			point = new Point(LevX, 0);
		}
		
		public function tick():void
		{
			
		}
		
		public function render(screen:BitmapData):void
		{
			bitmapData.rect.x = LevX;
			point.x = LevX;
			point.y = 25;
			screen.copyPixels(bitmapData, bitmapData.rect, point, null, null, true);
			for (var i:int = 0; i < enemies.length; i++) {
				screen.copyPixels(enemies[i].sprite, enemies[i].sprite.rect, enemies[i].point, null, null, true);
			}
		}
        
		public function addMob(e:Mob):void {
			enemies.push(e);
		}
		
	}

}