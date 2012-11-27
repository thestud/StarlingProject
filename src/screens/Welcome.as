package screens
{
	import com.greensock.TweenLite;
	
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	
	public class Welcome extends Sprite
	{
		private var bg:Image;
		
		private var title:Image; 
		
		private var hero:Image;
		
		private var playBtn:Button;
		private var aboutBtn:Button;
		
		public function Welcome()
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			
		}
		
		private function onAddedToStage(event:Event):void
		{
			trace('welcome screen intialized'); 
			
			drawScreen(); 
		}
		
		private function drawScreen():void
		{
			bg = new Image(Assets.getTexture("BgWelcome")); 
			this.addChild(bg); 
			
			//title = new Image(Assets.getTexture("WelcomeTitle")); 
			title = new Image(Assets.getAtlas().getTexture("welcome_title")); 
			title.x = 440;
			title.y = 20; 
			this.addChild(title); 
			
			hero = new Image(Assets.getAtlas().getTexture("welcome_hero"));
			hero.x =  -hero.width; 
			hero.y = 100;
			this.addChild(hero); 
			
			playBtn = new Button(Assets.getAtlas().getTexture("welcome_playButton"));
			playBtn.x = 500; 
			playBtn.y = 260; 
			this.addChild(playBtn);
			
			aboutBtn = new Button(Assets.getAtlas().getTexture("welcome_aboutButton"));
			aboutBtn.x = 410;
			aboutBtn.y = 380; 
			this.addChild(aboutBtn); 
			
			playBtn.addEventListener(TouchEvent.TOUCH, onPlayButton); 
						
		}
		
		private function onPlayButton():void
		{
			trace('hello'); 
			
		}
		
		private function onMainMenuClick(event:Event):void
		{
			trace(); 
			trace(event.target as Button);
			
		}
		
		public function initialize():void
		{
			visible = true; 
			
			hero.x =  -hero.width; 
			hero.y = 100;
			
			TweenLite.to(hero, 2, {x:80});
			
			this.addEventListener(Event.ENTER_FRAME, heroAnimation); 
		}
		
		private function heroAnimation(event:Event):void
		{
			var currentDate:Date = new Date(); 
			hero.y = 100 +  (Math.cos(currentDate.getTime() * 0.002) * 25); 
			playBtn.y = 260 +  (Math.cos(currentDate.getTime() * 0.002) * 10); 
			aboutBtn.y = 380 +  (Math.cos(currentDate.getTime() * 0.002) * 10); 
		}
		
	}
}