package net.burrito.levels 
{
	import net.burrito.entities.mobs.missile;
	import net.burrito.entities.mobs.Mob;
	import net.burrito.Utils.*;
	import net.burrito.client.Main;
	/**
	 * ...
	 * @author Burrito119
	 */
	public class EnemyGenerator 
	{
		public var mob:String;
		public var mode:String;
		
		public function EnemyGenerator(name:String, mode:String = "rand") 
		{
			mob = name;
			mode = mode;
		}
		
		public function randGenerate(lev:Level, number:int):void {
			for (var i:int = 0; i <= number; i++) {
				var y:Number = Math.random() * Main.stageHeight;
				var x:Number = Math.random() * Main.stageWidth + Main.stageWidth;
				if(mob == "missile"){
					LevelHelper.addEnemy(lev, new missile(x , y + 25, Assets.ALIEN_SPRITE));
				}
				else if (mob == "missile_boss") {
					LevelHelper.addEnemy(lev, new missile(x, y + 25, Assets.A_BOSS_SPRITE));
				}
			}
			
		}
		
	}

}