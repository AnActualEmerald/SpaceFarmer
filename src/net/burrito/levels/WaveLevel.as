package net.burrito.levels 
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.utils.Timer;
	import net.burrito.entities.Entity;
	import net.burrito.entities.mobs.Mob;
	import net.burrito.entities.mobs.Player;
	import net.burrito.terrain.goalBasic;
	import net.burrito.terrain.groundBasic;
	import net.burrito.terrain.slopeBasic;
	import net.burrito.terrain.Terrain;
	import net.burrito.client.Main;
	import net.burrito.Utils.Assets;
	import net.burrito.Utils.LevelHelper;
	import net.burrito.levels.BossLevels.*;
	/**
	 * ...
	 * @author Burrito119
	 */
	public class WaveLevel extends Level
	{
		public static var testLev:Boss1 = new Boss1(1);
		public static var lev1:WaveLevel = new WaveLevel("endless", 3, 0, Assets.BG_DARK);
		public static var lev2:WaveLevel = new WaveLevel("endless", 4, 2, Assets.BG_LIGHT);
		public static var lev3:WaveLevel = new WaveLevel("endless", 5, 3, Assets.BG_DARK);
		
		public var collide:Vector.<Boolean> = new Vector.<Boolean>;
		public var mode:String;
		public var generator:EnemyGenerator = new EnemyGenerator("missile");
		public var timer:int = 0;
		public var difficulty:int;
		public var spawnRate:int;
		public var waveNum:int = 0;
		
		public var bg:BitmapData;
		private var spawned:Boolean = false;
		private var curX:int = 0, curY:int = 400;
		
		public function WaveLevel(mode:String, difficulty:int, id:int, bg:BitmapData) 
		{
			this.mode = mode;
			this.difficulty = difficulty;
			this.bg = bg;
			
			super(id);
			
			load();
		}
		
		public function load():void {
			if (difficulty == 1) {
				spawnRate = 3;
			}
			
			if (difficulty == 2) {
				spawnRate = 8;
			}
			
			if (difficulty == 3) {
				spawnRate = 13;
			}
			
			if (difficulty >= 4 && difficulty < 10) {
				spawnRate = 18 + difficulty + 1;
			}
			
			if (difficulty >= 10) {
				spawnRate = 900;
			}
			
			
		}
		
		public function nextWave(wait:int, amt:int):void {
			if (wait == 0) {
				if (spawnRate < 1000){
					generator.randGenerate(this, amt);
					spawned = true;
					spawnRate += difficulty
					timer = 0;
				}
			}
			
			else if (timer == wait * 30) {
				if(waveNum < difficulty * 5){
					generator.randGenerate(this, amt);
					waveNum++;
				}else {
					done = 1;
				}
			}
			else if (timer == (wait * 2) * 30) {
				timer = 0;
				spawnRate += difficulty;
			}
			timer++;
			
		}
		
		override public function tick():void {
			if(done == 0){
				nextWave(1, spawnRate);
			}else if (done == 1){
				done = 2
			}
			
			for (var m:int = 0; m < enemies.length; m++ ) {
				enemies.reverse();
				var mm:Mob = enemies.pop();
				enemies.reverse();
				if (mm.alive)
					enemies.push(mm);
				
			}
			
			for (var i:int = 0; i < enemies.length; i++) {
				enemies[i].tick();
			}
		}
		
		
		
		
	}

}