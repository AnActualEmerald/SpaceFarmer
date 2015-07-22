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
		var frames:Vector.<BitmapData>;
		var currentFrame:int = 0;
		
		public function Animation(frames:Vector.<BitmapData>) 
		{
			this.frames = frames;
		}
		
		public function next():BitmapData {
			if (currentFrame >= frames.length)
				currentFrame = 0;
			
			var returnFrame:BitmapData = frames[currentFrame];
			currentFrame++;
			
			return returnFrame;
		}
		
		public function Frames():int {
			return frames.length;
		}
	}

}