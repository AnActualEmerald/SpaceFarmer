package net.burrito.client
{
	import adobe.utils.ProductManager;
	import flash.display.Bitmap;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.display.BitmapData
	import flash.display.StageQuality;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.display.StageDisplayState;
	import flash.events.KeyboardEvent
	import flash.events.Event;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.text.*;
	import flash.net.FileReference;
	import net.burrito.client.GUI.GUI;
	import net.burrito.entities.mobs.missile;
	import net.burrito.entities.mobs.Mob;
	import net.burrito.entities.mobs.Player;
	import net.burrito.levels.EnemyGenerator;
	import net.burrito.levels.Level;
	
	import net.burrito.Utils.*;
	
	/**
	 * ...
	 * @author Burrito119
	 */
	public class Main extends Sprite
	{
		public var spawnX:int = 50, spawnY:int = stage.stageHeight / 2;
		
		public var screen:BitmapData = new BitmapData(stage.stageWidth, stage.stageHeight, false, 0xffffff);
		public static var mouse:BitmapData = new BitmapData(15, 15, true);
		public var bitmap:Bitmap = new Bitmap(screen);
		public static var rect:Rectangle = new Rectangle();
		public static var me:Player;
		public static var lev:Level;
		public static var stageWidth:int;
		public static var stageHeight:int;
		public static var points:int = 0;
		public static var high:int = 0;
		private var feild:TextField = new TextField();
		private var pointField:TextField = new TextField();
		private var HighScoreF:TextField = new TextField();
		private var HighPoints:Number;
		private var levelId:int = 0;
		private var hasStarted:Boolean = false;
		private var paused:Boolean = false;
		private var pausedIsDown:Boolean = false;
		
		public static var levels:Vector.<Level> = new Vector.<Level>;
		
		public function Main()
		{
			lev = Level.lev1;
			me = new Player(spawnX, spawnY, Assets.PLAYER_BIT);
			
			lev.player = me;
			
			load();
	
			//Add game bitmap
			addChild(bitmap);
			addChild(pointField);
			addChild(HighScoreF);
			addChild(BurritoUIManager.Gas.bar);
			
			
			stageHeight = stage.height;
			stageWidth = stage.width;
			
			//Enter main game loop
			addEventListener(Event.ENTER_FRAME, run);
			
			//Add KeyListeners
			stage.addEventListener(KeyboardEvent.KEY_DOWN, Input.keyPressed);
			stage.addEventListener(KeyboardEvent.KEY_UP, Input.keyRelesed);
			
			rect.x = 0;
			rect.y = 0;
			rect.width = stage.width;
			rect.height = stage.height;
			
			stage.quality = StageQuality.BEST;
			stage.align = StageAlign.TOP;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.displayState = StageDisplayState.NORMAL;
			
		}
		
		public function run(e:Event):void {
			tick();
			render();
		}
		
		public function load():void {
			levels.push(Level.lev1);
			levels.push(Level.lev2);
			levels.push(Level.lev3); 
			pointRender();
			buildGUI();
		}
		
		private function tick():void {
			if (!hasStarted){ 
				begin();
				return;
			}
			
			if (Input.isKeyDown(Key.P)) {
				if(!pausedIsDown)
					paused = !paused;
				pausedIsDown = true;
			}
			else {
				pausedIsDown = false;
			}
			
			if (paused) {
				pause();				
				return;
			}else {
				if (contains(feild))
					removeChild(feild);
			}
			
			if (lev.finalWave == 2) {
				levelId++;
				for (var i:int = 0; i < levels.length; i++){
					if (levelId == levels[i].id) {
						lev = levels[i];
					}
				
				}
				me.lev = lev;
				
			}
			if(me.alive){	
				me.tick();
				lev.tick();
				highScore();
				
				//BurritoUIManager.tick(mouseX, mouseY);
				return;
			}
			screen.fillRect(rect, 0x000000);
			
			if(contains(pointField)){
				removeChild(pointField);
			}
			if (contains(BurritoUIManager.Gas.bar)) {
				removeChild(BurritoUIManager.Gas.bar);
			}
			feild.text = "Your score was: " + points.toString() +"\nPress R to try again";
			feild.autoSize = TextFieldAutoSize.CENTER;
			feild.x = (stage.width / 2) - feild.width / 2;
			feild.y = (stage.height / 2) - feild.height / 2;
			feild.textColor = 0xffffff;
			HighScoreF.textColor = 0xffffff;
			addChild(feild);
			resetCheck();
		}
		
		private function pause():void {
			feild.text = "Press P to Continue";
			feild.autoSize = TextFieldAutoSize.CENTER;
			feild.x = (stage.width / 2) - feild.width / 2;
			feild.y = (stage.height / 2) - feild.height / 2;
			feild.textColor = 0xffffff;
			HighScoreF.textColor = 0xffffff;
			addChild(feild);
		}
		
		private function begin():void {
			
			screen.fillRect(rect, 0x000000);
			
			if(contains(pointField)){
				removeChild(pointField);
			}
			
			if (contains(BurritoUIManager.Gas.bar)) {
				removeChild(BurritoUIManager.Gas.bar);
			}
			
			feild.text = "Press Enter To Begin";
			feild.autoSize = TextFieldAutoSize.CENTER;
			feild.x = (stage.width / 2) - feild.width / 2;
			feild.y = (stage.height / 2) - feild.height / 2;
			feild.textColor = 0xffffff;
			HighScoreF.textColor = 0xffffff;
			addChild(feild);
			
			if (Input.isKeyDown(Key.ENTER)) {
				addChild(BurritoUIManager.Gas.bar);
				addChild(pointField);
				hasStarted = true;
				removeChild(feild);
			}
		}
		
		private function render():void {
			if (!hasStarted) return;
			
			if (me.alive) {
				screen.lock();
					
					screen.fillRect(rect, 0xffffff);
					
					lev.render(screen);
					me.render(screen, null);
					pointRender();
					BurritoUIManager.Gas.render(screen);
					//BurritoUIManager.render(screen);
				screen.unlock();
				return;
			}
		}
		
		private function pointRender():void {
			pointField.text = "Score: " + points.toString();
			pointField.x = 0;
			pointField.y = 0;
		}
		
		public function highScore():void {
			if (points >= HighPoints) {
				HighPoints = points;
				HighScoreF.text = "High Score: " + HighPoints;
			}
		}
		
		private function resetCheck():void {
			if (Input.isKeyDown(Key.R))
				reset();
		}
		
		private function reset():void {
			me.alive = true;
			me.point.x = spawnX;
			me.point.y = spawnY;
			points = 0;
			for (var x:int = 0; i < lev.enemies.length; i++ ){
				for (var i:int = 0; i < lev.enemies.length; i++) {
					lev.enemies.pop();
					break;
				}
			}
			removeChild(feild);
			addChild(pointField);
			addChild(BurritoUIManager.Gas.bar);
			HighScoreF.textColor = 0x000000;
			me.fuel = 625;
			lev.timer = 0;
			lev.waveNum = 0;
			lev.finalWave = 0;
			lev.load();
		}
		
		public function buildGUI():void {
			BurritoUIManager.add(new GUI(100, 100, Assets.GRASS_TILE));
		}
	}
	
}