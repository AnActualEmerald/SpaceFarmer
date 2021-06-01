package net.burrito.levels 
{
	import adobe.utils.CustomActions;
	import flash.display.BitmapData;
	import flash.text.AntiAliasType;
	import net.burrito.entities.Attack;
	import net.burrito.entities.mobs.Boss;
	import net.burrito.Utils.Animation;
	/**
	 * ...
	 * @author ...
	 */
	public class BossLevel extends Level 
	{
		protected var boss:Boss;
		protected var bossAttacks:Vector.<Attack>;
		protected var bossIdle:Animation;
		protected var bossDeath:Animation;
		
		public function BossLevel(id:int) 
		{
			super(id);
		}
		
		override public function tick():void 
		{
			for (var i:int = 0; i < enemies.length; i++) {
				enemies[i].tick();
			}
			
			super.tick();
			
			if (!boss.alive)
				done = 2;
		}
		
		protected function initBoss(hp:int, timing:int, x:int, y:int):void {
			boss = new Boss(hp, bossAttacks, timing, x, y, bossIdle, bossDeath);
			addMob(boss);
		}
	}

}