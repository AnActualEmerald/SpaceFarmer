package net.burrito.entities.mobs 
{
	import flash.display.BitmapData;
	import net.burrito.entities.Attack;
	import net.burrito.Utils.Animation;
	/**
	 * ...
	 * @author ...
	 */
	public class Boss extends Mob
	{
		var health:int;
		var attacks:Vector.<Attack>;
		var idleAnim:Animation;
		var deathAnim:Animation;
		var attackTiming:int;
		var currentAttack:int;
		
		public function Boss(hp:int, attacks:Vector.<Attack>, timing:int, x:int, y:int, idle:Animation, death:Animation) 
		{
			super(x, y, idle.next());
			health = hp;
			this.attacks = attacks;
			idleAnim = idle;
			deathAnim = death;
			attackTiming = timing;
		}
		
		private var numFrames:int = attackTiming;
		override public function tick():void {
			if (health <= 0){
				var tmp:BitmapData = deathAnim.next();
				if (tmp == null) {
					alive = false;
				}
				else {
					this.sprite = tmp;
				}
				
			}else {
				this.sprite = idleAnim.next();
			}
			
			if (numFrames >= attackTiming)
			{
				attacks[currentAttack].Execute(this.lev);
				numFrames = 0;
			}
			
			numFrames++;
		}		
	}

}