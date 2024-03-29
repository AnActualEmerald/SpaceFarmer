package net.burrito.Utils 
{
	import flash.display.BitmapData;
	import flash.display.Bitmap;
	import flash.media.Sound;
	import flash.net.URLRequest;
	/**
	 * ...
	 * @author Burrito119
	 */
	public class Assets 
	{
		[Embed(source = "/../assets/player_1.png")]
		private static const PLAYER:Class;
		public static const PLAYER_BIT:BitmapData = Bitmap(new PLAYER).bitmapData;
		
		[Embed(source = "/../assets/water.png")]
		private static const WATER:Class;
		public static const WATER_TILE:BitmapData = Bitmap(new WATER).bitmapData;
		
		[Embed(source = "/../assets/grass.png")]
		private static const GRASS:Class;
		public static const GRASS_TILE:BitmapData = Bitmap(new GRASS).bitmapData;
		
		[Embed(source = "/../assets/over.png")]
		private static const OVER:Class;
		public static const OVER_SCREEN:BitmapData = Bitmap(new OVER).bitmapData;
		
		[Embed(source = "/../assets/alien.png")]
		private static const ALIEN:Class;
		public static const ALIEN_SPRITE:BitmapData = Bitmap(new ALIEN).bitmapData;
		
		[Embed(source = "/../assets/alien_boss.png")]
		private static const ALIEN_BOSS:Class;
		public static const A_BOSS_SPRITE:BitmapData = Bitmap(new ALIEN_BOSS).bitmapData;
		
		[Embed(source = "/../assets/BG1.png")]
		private static const BG1:Class;
		public static const BG_DARK:BitmapData = Bitmap(new BG1).bitmapData;
		
		[Embed(source = "/../assets/BG2.png")]
		private static const BG2:Class;
		public static const BG_LIGHT:BitmapData = Bitmap(new BG2).bitmapData;
		
		[Embed(source = "/../assets/shoot.mp3")]
		private static const SHOOT_SOUND:Class;
		public static const PEW:Sound = Sound(new SHOOT_SOUND);
		
		[Embed(source = "/../assets/ded.mp3")]
		private static const DEAD_SOUND:Class;
		public static const DED:Sound = Sound(new DEAD_SOUND);
		
		[Embed(source = "/../assets/bg_music.mp3")]
		private static const BG_MUSIC:Class;
		public static const BACKING:Sound = Sound(new BG_MUSIC);
	}

}