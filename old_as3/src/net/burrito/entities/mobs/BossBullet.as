package net.burrito.entities.mobs 
{
	import flash.display.BitmapData;
	import flash.geom.Point;
	import net.burrito.levels.Level;
	/**
	 * ...
	 * @author ...
	 */
	public class BossBullet extends Bullet
	{
		private var spawnPoint:Point;
		private var targetPoint:Point;
		
		public function BossBullet(spawn:Point, target:Point, lev:Level) 
		{
			super(spawn.x, spawn.y, lev);
			spawnPoint = spawn;
			targetPoint = target;
			shouldDamageBoss = false;
			this.sprite = new BitmapData(width, height, false, 0xFF2424);
		}
		
		override public function move():void 
		{
			var rot:Number = Math.atan2(targetPoint.y - spawnPoint.y, targetPoint.x - spawnPoint.x);
			point.x += Math.cos(rot) * speed;
			point.y += Math.sin(rot) * speed;
		}		
	}

}