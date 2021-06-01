package net.burrito.client.GUI 
{	
	import flash.display.BitmapData;
	import flash.display.Shape;
	import flash.geom.Rectangle;
	import net.burrito.Utils.Assets;
	/**
	 * ...
	 * @author Burrito119
	 */
	public class GasBar extends GUI
	{
		public var bar:Shape = new Shape();
		public var amount:int = 0;
		private var oldAmount:int = 0;
		
		public function GasBar(x:int, y:int) 
		{
			super(x, y, Assets.ALIEN_SPRITE);
		}
		
		override public function render(screen:BitmapData):void {
			if (amount != oldAmount) {
				bar.graphics.clear();
				bar.graphics.beginFill(0xffffff);
				bar.graphics.drawRect(70, 0, amount + 3, 25);
				bar.graphics.beginFill(0xffff00);
				bar.graphics.drawRect(70, 0, amount, 25);
				bar.graphics.endFill();
				oldAmount = amount;
			}
			
		}
		
	}

}