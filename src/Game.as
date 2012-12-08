package
{
	import flash.events.MouseEvent;
	
	import screens.Welcome;
	
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class Game extends Sprite
	{
		private var screenWelcome:Welcome; 
		
		public function Game()
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage); 
		}
		
		private function onAddedToStage(event:Event):void
		{
			trace('starling from intialized'); 
			
			screenWelcome = new Welcome(); 
			this.addChild(screenWelcome); 
			screenWelcome.initialize(); 
			
			screenWelcome.addEventListener(Event.TRIGGERED, onRoot); 
		}
		
		private function onRoot():void
		{
			trace('on The root'); 
		}
		
	}
}