package net.burrito.Utils 
{
	import net.burrito.entities.mobs.Mob;
	import net.burrito.levels.Level;
	import net.burrito.client.Main;
	/**
	 * ...
	 * @author Burrito119
	 */
	public class LevelHelper 
	{
		
		public static function addEnemy(lev:Level, mob:Mob):void {
			lev.enemies.push(mob);
		}
		
		public static function changeLevel(lev:Level):void {
			Main.lev = lev;
		}
		
		
		
	}

}