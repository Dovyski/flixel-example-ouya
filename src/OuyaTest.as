package  
{
	import com.zehfernando.input.binding.KeyActionBinder;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flixel.*;
	
	[SWF(width="1920", height="1080", backgroundColor="#000000")]
	public class OuyaTest extends FlxGame
	{
		public function OuyaTest() {
			// Initialize KeyActionBinder in the first frame/class, according
			// to the lib docs.
			KeyActionBinder.init(stage);
			
			super(960, 540, PlayState, 2, 30, 30, false, true);
			FlxG.debug = true;
			
			stage.scaleMode = StageScaleMode.SHOW_ALL;
			stage.align = "";
		}
	}
}