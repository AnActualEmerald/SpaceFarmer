package net.burrito.entities.mobs 
{
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
		}
		
		override public function move():void 
		{
			if (this.spawnPoint.x < this.targetPoint.x)
				this.point.x += speed;
			else 
				this.point.x -= speed;
				
			if (this.spawnPoint.y < this.targetPoint.y)
				this.point.y += speed;
			else
				this.point.y -= speed;
		}
		
	}

}