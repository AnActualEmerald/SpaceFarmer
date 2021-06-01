package net.burrito.client
{
	import adobe.utils.ProductManager;
	import flash.display.Bitmap;
	import flash.display.DisplayObject;
	import flash.display.Loader;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.display.BitmapData
	import flash.display.StageQuality;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.display.StageDisplayState;
	import flash.events.IOErrorEvent;
	import flash.events.KeyboardEvent
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.ProgressEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.net.URLRequest;
	import flash.text.*;
	import flash.net.FileReference;
	import net.burrito.client.GUI.GUI;
	import net.burrito.entities.mobs.missile;
	import net.burrito.entities.mobs.Mob;
	import net.burrito.entities.mobs.Player;
	import net.burrito.levels.*;
	import flash.display.SimpleButton;
	
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
		public static var muted:Boolean = false;
		public static var no_sounds:Boolean = false;
		private var feild:TextField = new TextField();
		private var pointField:TextField = new TextField();
		private var HighScoreF:TextField = new TextField();
		private var HighPoints:Number;
		private var levelId:int = 0;
		private var hasStarted:Boolean = false;
		private var paused:Boolean = false;
		private var pausedIsDown:Boolean = false;
		private var music:Sound = Assets.BACKING;
		private var muteButton:SimpleButton;
		private var chan:SoundChannel;
		private var loader:Loader;
		
		public static var levels:Vector.<Level> = new Vector.<Level>;
		
		private function loading(e:Event):void
		{
			addChild(new Bitmap(Assets.GRASS_TILE));
		}
		
		private function doneFunc(e:Event):void {
			addChild(new Bitmap(Assets.WATER_TILE));
		}
		
		private function erp(e:Event):void {
			addChild(new Bitmap(Assets.OVER_SCREEN));
		}
		
		public function Main()
		{
			trace("beginning load");
			loader = new Loader();
			addChild(loader);
			loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, loading);
			loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, erp);
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, doneFunc);
			loader.load(new URLRequest("https://github.com/Burrito119/SpaceFarmer/tree/master/assets/tekkit.png"));
			addChild(loader.content);
			
			
			
			
			
			
			
			lev = WaveLevel.lev1;
			me = new Player(spawnX, spawnY, Assets.PLAYER_BIT);
			
			lev.player = me;
			
			load();
			
			var down:Bitmap = new Bitmap(Assets.GRASS_TILE);
			var over:Bitmap = new Bitmap(Assets.WATER_TILE);
			var up:Bitmap = new Bitmap(Assets.GRASS_TILE);
			var hit:Bitmap = new Bitmap(Assets.GRASS_TILE);
			muteButton = new SimpleButton(up, over, down, hit);
			
			//Add game bitmap
			addChild(bitmap);
			addChild(pointField);
			addChild(HighScoreF);
			addChild(muteButton);
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
			
			music.addEventListener(Event.SOUND_COMPLETE, loopBGMusic);
			chan = music.play();
			
			muteButton.visible = true;
			muteButton.x = 800 - 16;
			muteButton.y = 600 - 16;
			muteButton.addEventListener(MouseEvent.CLICK, mute);
		}
		
		private function mute(e:Event):void {
			if (!muted && !no_sounds) {
				chan.stop();
				muted = true;
			}else if (muted && !no_sounds) {
				no_sounds = true;
				muted = false;
				chan = music.play();
			}else if (!muted && no_sounds) {
				muted = true;
				chan.stop();
			}
			else {
				chan = music.play();
				muted = false;
				no_sounds = false;
			}
		}
		public function loopBGMusic(e:Event):void {
			chan = music.play();
			music.addEventListener(Event.SOUND_COMPLETE, loopBGMusic);
		}
		
		public function run(e:Event):void {
			tick();
			render();
		}
		
		public function load():void {
			levels.push(WaveLevel.lev1);
			levels.push(WaveLevel.lev1Boss)
			levels.push(WaveLevel.lev2);
		//	levels.push(WaveLevel.lev3); 
			lev.load();
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
			
			if (lev.done == 2) {
				levelId++;
				for (var i:int = 0; i < levels.length; i++){
					if (levelId == levels[i].id) {
						lev = levels[i];
						lev.load();
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
			lev = WaveLevel.lev1;
			levelId = 0;
			lev.done = 0;
			me.lev = lev;
			lev.load();
		}
		
		public function buildGUI():void {
			BurritoUIManager.add(new GUI(100, 100, Assets.GRASS_TILE));
		}
	}
	
}