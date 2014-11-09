package 
{
	import com.zehfernando.input.binding.KeyActionBinder;
	import flash.desktop.NativeApplication;
	import flash.events.Event;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.system.Capabilities;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	
	/**
	 * ...
	 * @author Dovyski
	 */
	public class Main extends Sprite 
	{
		private var mGame :OuyaTest;
		
		public function Main():void 
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			stage.addEventListener(Event.DEACTIVATE, deactivate);
			stage.addEventListener(Event.RESIZE, setUpScreen);

			// Initialize KeyActionBinder in the first frame/class, according
			// to the lib docs.
			KeyActionBinder.init(stage);
			
			// touch or gesture?
			Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
			
			// entry point
			mGame = new OuyaTest();
			addChild(mGame);
			
			setUpScreen(null);
			
			// new to AIR? please read *carefully* the readme.txt files!
		}
		
		private function setUpScreen(e:Event) :void {
			var aDeviceWidth  :Number = Capabilities.screenResolutionX;
			var aDeviceHeight :Number = Capabilities.screenResolutionY;
			
			var aGameStageWidth :Number, aGameStageHeight :Number, aRescaleRatio :Number;
			
			stage.removeEventListener(Event.RESIZE, setUpScreen);

			aGameStageWidth  = Math.min(aDeviceWidth, aDeviceHeight);
			aGameStageHeight = Math.max(aDeviceWidth, aDeviceHeight);
				
			aRescaleRatio = aGameStageWidth / 1280;
			
			//I use ratio to rescale every object, ie:
			mGame.scaleX = mGame.scaleY = aRescaleRatio;
		}
		
		private function deactivate(e:Event):void 
		{
			// make sure the app behaves well (or exits) when in background
			NativeApplication.nativeApplication.exit();
		}
	}
}