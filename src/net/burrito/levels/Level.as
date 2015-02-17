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
	/**
	 * ...
	 * @author Burrito119
	 */
	public class Level 
	{
		public static var lev1:Level = new Level("endless", 3, 0, Assets.BG_DARK);
		public static var lev2:Level = new Level("endless", 4, 1, Assets.BG_LIGHT);
		public static var lev3:Level = new Level("endless", 5, 2, Assets.BG_DARK);
		
		public var ground:Vector.<Terrain> = new Vector.<Terrain>;
		public var collide:Vector.<Boolean> = new Vector.<Boolean>;
		public var enemies:Vector.<Mob> = new Vector.<Mob>;
		public var mode:String;
		public var id:int;
		public var bitmapData:BitmapData = new BitmapData(8155, 1000);
		public var LevX:int = 0;
		public var generator:EnemyGenerator = new EnemyGenerator("missile");
		public var timer:int = 0;
		public var point:Point;
		public var player:Player;
		public var difficulty:int;
		public var spawnRate:int;
		public var waveNum:int = 0;
		public var finalWave:int = 0;
		public var boss:EnemyGenerator = new EnemyGenerator("missile_boss");
		
		public var bg:BitmapData;
		private var spawned:Boolean = false;
		private var curX:int = 0, curY:int = 400;
		
		public function Level(mode:String, difficulty:int, id:int, bg:BitmapData) 
		{
			this.mode = mode;
			this.id = id;
			this.difficulty = difficulty;
			this.bg = bg;
			
			//addGround(0, 20);
			//addGround(1, 1);
			//addGround(0, 10);
			//addGround(1, 1);
			//addGround(0, 10);
			//addGround(0, 20);
			//addGround(1, 1);
			//addGround(0, 20);
			//addGround(1, 1);
			//addGround(0, 25);
			//addGround(2, 1);
			
			point = new Point(LevX, 0);
			
			load();
			createBitmap();
			
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
		
		public function getGround(i:int):Terrain {
			return this.ground[i];
		}
		
		public function addGround(id:int, amount:int):void {
			for (var i:int = 0; i < amount; i++) {
				if (id == groundBasic.id) {
					ground.push(new groundBasic(curX, curY));
					finishBuild(curX);
					
					curX += ground[i].width;

				}
				else if (id == slopeBasic.id) {
					finishBuild(curX);
					curY -= ground[i].height;
					
					ground.push(new slopeBasic(curX, curY));
					curX += ground[i].width;
					
				}
				else if (id == goalBasic.id) {
					finishBuild(curX);
					ground.push(new goalBasic(curX, curY));
					curX += ground[1].width;
				}
				
			}
		}
		
		public function finishBuild(x:int):void {
			for (var i:int = 0; i < 50; i++) {
				ground.push(new groundBasic(x, curY + ground[i].height * i));
			}
		}
		
		public function createBitmap():void {
			bitmapData.copyPixels(bg, bg.rect, new Point(0, 0), null, null, true);
			for (var i:int = 0; i < ground.length; i ++) {
				bitmapData.copyPixels(ground[i].getSprite(), ground[i].getSprite().rect, ground[i].p, null, null, true);
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
					finalWave = 1;
				}
			}
			else if (timer == (wait * 2) * 30) {
				timer = 0;
				spawnRate += difficulty;
			}
			timer++;
			
		}
		
		public function lastWave(wait:int, amt:int):void {
			if (timer == wait * 30) {
				boss.randGenerate(this, amt * difficulty / 2);
			}
			else if (timer == (wait * 3) * 30) {
				timer = 0;
				finalWave = 2;
			}
			timer++;
		}
		
		public function tick():void {
			if(finalWave == 0){
				nextWave(1, spawnRate);
			}else if (finalWave == 1){
				lastWave(10, spawnRate * 2);
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
		
		public function render(screen:BitmapData):void {
		
			bitmapData.rect.x = LevX;
			point.x = LevX;
			point.y = 25;
			screen.copyPixels(bitmapData, bitmapData.rect, point, null, null, true);
			for (var i:int = 0; i < enemies.length; i++) {
				screen.copyPixels(enemies[i].sprite, enemies[i].sprite.rect, enemies[i].point, null, null, true);
			}
		}
		
		public function addMob(e:Mob):void {
			enemies.push(e);
		}
		
	}

}