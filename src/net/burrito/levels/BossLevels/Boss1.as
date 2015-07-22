package net.burrito.levels.BossLevels 
{
	import flash.display.BitmapData;
	import net.burrito.levels.BossLevel;
	import net.burrito.entities.Attack;
	import net.burrito.levels.Level;
	import net.burrito.Utils.Animation;
	import net.burrito.Utils.Assets;
	/**
	 * ...
	 * @author ...
	 */
	public class Boss1 extends BossLevel
	{
		
		public function Boss1(id:int) 
		{
			super(id);
			bossAttacks = new Vector.<Attack>;
			bossAttacks.push(new Attack1());
			bossIdle = new Animation(new Vector.<BitmapData> (Assets.A_BOSS_SPRITE ), true);
			bossDeath = new Animation(new Vector.<BitmapData>(Assets.ALIEN_SPRITE, Assets.A_BOSS_SPRITE, Assets.ALIEN_SPRITE, Assets.A_BOSS_SPRITE, Assets.ALIEN_SPRITE, Assets.A_BOSS_SPRITE, Assets.ALIEN_SPRITE))
			this.initBoss(100, 30, 800 - 53, 300 - 34);
		}
		
	}
}

import flash.geom.Point;
import net.burrito.entities.Attack;
import net.burrito.entities.mobs.BossBullet;
import net.burrito.levels.Level;
class Attack1 implements Attack {
		
	public function Execute(lev:Level):void {
		lev.addMob(new BossBullet(new Point(800 - 16, 300 - 8), new Point(), lev));
		lev.addMob(new BossBullet(new Point(800 - 16, 300 - 24), new Point(0, 600), lev));
	}
	
}