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
			bossAttacks.push(new Attack2());
			bossAttacks.push(new Attack3());
			var idl:Vector.<BitmapData> = new Vector.<BitmapData>;
			idl.push(Assets.A_BOSS_SPRITE);
			var death:Vector.<BitmapData> = new Vector.<BitmapData>;
			death.push(Assets.ALIEN_SPRITE);
			death.push(Assets.GRASS_TILE);
			death.push(Assets.A_BOSS_SPRITE);
			death.push(Assets.ALIEN_SPRITE);
			bossIdle = new Animation(idl, true);
			bossDeath = new Animation(death);
		}
		
		override public function load():void 
		{
			initBoss(100, 30, 800 - 53, 300 - 34);
		}
		
	}
}

import flash.geom.Point;
import net.burrito.entities.Attack;
import net.burrito.entities.mobs.BossBullet;
import net.burrito.levels.Level;
import net.burrito.Utils.Assets;
import net.burrito.client.Main;
class Attack1 implements Attack {
		
	public function Execute(lev:Level):void {
		lev.addMob(new BossBullet(new Point(800 - 24, 300 - 8), new Point(800 - 30, 300 - 8), lev));
		lev.addMob(new BossBullet(new Point(800 - 24, 300 - 24), new Point(800 - 30, 300 - 24), lev));
		if(!Main.no_sounds)
		Assets.PEW.play();
	}
	
}

class Attack2 implements Attack {
		
	public function Execute(lev:Level):void {
		lev.addMob(new BossBullet(new Point(800 - 24, 300 - 8), new Point(0, 32), lev));
		lev.addMob(new BossBullet(new Point(800 - 24, 300 - 24), new Point(0, 600 - 32), lev));
		if(!Main.no_sounds)
		Assets.PEW.play();
	}
	
}

class Attack3 implements Attack {
		
	public function Execute(lev:Level):void {
		for (var i:int = 0; i < 10; i++)
		{
			lev.addMob(new BossBullet(new Point(800 - 24, 300 - 24), new Point(0, 0 + 64 * i), lev));
		}
		if(!Main.no_sounds)
		Assets.PEW.play();
	}
	
}