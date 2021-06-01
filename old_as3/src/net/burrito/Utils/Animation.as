package net.burrito.Utils 
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Loader;
	/**
	 * ...
	 * @author ...
	 */
	public class Animation 
	{
		private var frames:Vector.<BitmapData>;
		private var currentFrame:int = 0;
		private var looping:Boolean = false;
		
		public function Animation(frames:Vector.<BitmapData>, looping:Boolean = false) 
		{
			this.frames = frames;
			this.looping = looping;
		}
		
		public function next():BitmapData {
			if (currentFrame >= frames.length && looping)
				currentFrame = 0;
			else if (currentFrame >= frames.length && !looping)
				return null;
			
			var returnFrame:BitmapData = frames[currentFrame];
			currentFrame++;
			
			return returnFrame;
		}
		
		public function Frames():int {
			return frames.length;
		}
	}

}