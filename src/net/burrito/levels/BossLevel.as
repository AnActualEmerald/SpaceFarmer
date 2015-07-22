package net.burrito.levels 
{
	import adobe.utils.CustomActions;
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
			boss.tick();
		}
		
		protected function initBoss(hp:int, timing:int, x:int, y:int):void {
			boss = new Boss(hp, bossAttacks, timing, x, y, bossIdle, bossDeath);
			addMob(boss);
		}
	}

}