package net.burrito.entities.mobs 
{
	import flash.display.BitmapData;
	import net.burrito.client.Main;
	import net.burrito.entities.Attack;
	import net.burrito.Utils.Animation;
	import net.burrito.Utils.Assets;
	/**
	 * ...
	 * @author ...
	 */
	public class Boss extends Mob
	{
		private var health:int;
		private var attacks:Vector.<Attack>;
		private var idleAnim:Animation;
		private var deathAnim:Animation;
		private var attackTiming:int;
		private var currentAttack:int;
		
		public function Boss(hp:int, attacks:Vector.<Attack>, timing:int, x:int, y:int, idle:Animation, death:Animation) 
		{
			super(x, y, Assets.A_BOSS_SPRITE);
			health = hp;
			this.attacks = attacks;
			idleAnim = idle;
			deathAnim = death;
			attackTiming = timing;
			isBoss = true;
		}
		
		private var numFrames:int = attackTiming;
		override public function tick():void {
			if (health <= 0){
				var tmp:BitmapData = deathAnim.next();
				if (tmp == null) {
					alive = false;
					Main.points += 1000;
				}
				else {
					this.sprite = tmp;
				}
				return;
				
			}else {
				this.sprite = idleAnim.next();
			}
			
			if (numFrames >= attackTiming)
			{
				if (currentAttack >= attacks.length)
					currentAttack = 0;
				attacks[currentAttack].Execute(this.lev);
				numFrames = 0;
				currentAttack++;
			}
			
			numFrames++;
		}		
		
		public function Damage(amt:int):void {
			health -= amt;
		}
	}

}