package screens
{
	import com.greensock.TweenLite;
	
	import flash.events.MouseEvent;
	
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.model.TempEventModel;
	
	
	public class Welcome extends Sprite
	{
		private var bg:Image;
		
		private var title:Image; 
		
		private var hero:Image;
		
		private var playBtn:Button;
		private var aboutBtn:Button;
		
		private var tempEventModel:TempEventModel = TempEventModel.getInstance(); 
		
		public function Welcome()
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			//tempEventModel.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown); 
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
			
			
			addEventListener(Event.TRIGGERED, onMainMenuClick);
			
			playBtn.addEventListener(Button.BUTTON_CLICK, onPlayBtnButtonClick); 
			aboutBtn.addEventListener(Button.BUTTON_CLICK, onAboutBtnButtonClick); 

						
		}
		
		private function onAboutBtnButtonClick():void
		{
			trace('about button was clicked');
		}
		
		private function onPlayBtnButtonClick():void
		{
			trace('play button was clicked'); 
			
		}
		
		private function onMainMenuClick(event:Event):void
		{
			trace('hello!'); 
			trace(event.target as Button);
			
		}
		
		private function onMouseDown(event:MouseEvent):void
		{
			trace();
			trace(event.relatedObject as Button);
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