package  
{
	import com.zehfernando.input.binding.GamepadControls;
	import com.zehfernando.input.binding.KeyActionBinder;
	import flash.system.Capabilities;
	import flash.ui.GameInputDevice;
	import flixel.ui.FlxButton;

	import flixel.*;
	import flixel.ui.FlxText;

	/**
	 * ...
	 * @author Dovyski
	 */
	public class PlayState extends FlxState
	{
		private var mSprite :FlxSprite;
		private var mText :FlxText;
		private var mBinder :KeyActionBinder;
		private var mButton :FlxButton;
		
		override public function create():void {
			mSprite = new FlxSprite(FlxG.width / 2, FlxG.height / 2);
			mSprite.makeGraphic(50, 50, 0xffff0000);
			mSprite.angularVelocity = 50;

			mText = new FlxText(FlxG.width / 2, 50, 200, "Hello world!");
			
			add(mSprite);
			add(mText);
			
			mBinder = new KeyActionBinder();
			
			mBinder.addGamepadActionBinding("CONTROL_LB",        GamepadControls.LB);
			mBinder.addGamepadActionBinding("CONTROL_RB",        GamepadControls.RB);
			mBinder.addGamepadActionBinding("CONTROL_LT",        GamepadControls.LT);
			mBinder.addGamepadActionBinding("CONTROL_RT",        GamepadControls.RT);
			mBinder.addGamepadActionBinding("CONTROL_DU",        GamepadControls.DPAD_UP);
			mBinder.addGamepadActionBinding("CONTROL_DD",        GamepadControls.DPAD_DOWN);
			mBinder.addGamepadActionBinding("CONTROL_DL",        GamepadControls.DPAD_LEFT);
			mBinder.addGamepadActionBinding("CONTROL_DR",        GamepadControls.DPAD_RIGHT);
			mBinder.addGamepadActionBinding("CONTROL_AU",        GamepadControls.ACTION_UP);
			mBinder.addGamepadActionBinding("CONTROL_AD",        GamepadControls.ACTION_DOWN);
			mBinder.addGamepadActionBinding("CONTROL_AL",        GamepadControls.ACTION_LEFT);
			mBinder.addGamepadActionBinding("CONTROL_AR",        GamepadControls.ACTION_RIGHT);
			mBinder.addGamepadActionBinding("CONTROL_SL_X",      GamepadControls.STICK_LEFT_X);
			mBinder.addGamepadActionBinding("CONTROL_SL_Y",      GamepadControls.STICK_LEFT_Y);
			mBinder.addGamepadActionBinding("CONTROL_SL_V",      GamepadControls.STICK_LEFT_PRESS);
			mBinder.addGamepadActionBinding("CONTROL_SR_X",      GamepadControls.STICK_RIGHT_X);
			mBinder.addGamepadActionBinding("CONTROL_SR_Y",      GamepadControls.STICK_RIGHT_Y);
			mBinder.addGamepadActionBinding("CONTROL_SR_V",      GamepadControls.STICK_RIGHT_PRESS);
			mBinder.addGamepadActionBinding("CONTROL_MSELECT",   GamepadControls.SELECT);
			mBinder.addGamepadActionBinding("CONTROL_MBACK",     GamepadControls.BACK);
			mBinder.addGamepadActionBinding("CONTROL_MSTART",    GamepadControls.START);
			mBinder.addGamepadActionBinding("CONTROL_MMENU",     GamepadControls.MENU);
			mBinder.addGamepadActionBinding("CONTROL_MOPTIONS",  GamepadControls.OPTIONS);
			mBinder.addGamepadActionBinding("CONTROL_MTRACKPAD", GamepadControls.TRACKPAD);
			mBinder.addGamepadActionBinding("CONTROL_MSHARE",    GamepadControls.SHARE);
			
			mBinder.onActionActivated.add(onActionActivated);
			mBinder.onActionDeactivated.add(onActionDeactivated);
			mBinder.onActionValueChanged.add(onActionValueChanged);
			mBinder.onDevicesChanged.add(onDevicesChanged);
			
			super.create();
			
			FlxG.mouse.show();
			
			mButton = new FlxButton(0, 0, "Console", function():void {
				//FlxG.debugger.toggleVisility();
			});
			
			add(mButton);
			
			var aDeviceWidth  :Number = Capabilities.screenResolutionX;
			var aDeviceHeight :Number = Capabilities.screenResolutionY;
			
			FlxG.log("width = " + aDeviceWidth + ", height = " + aDeviceHeight);
			FlxG.log("s_width = " + FlxG.stage.width + ", s_height = " + FlxG.stage.height);
			FlxG.log("s_fcwidth = " + FlxG.stage.fullScreenWidth + ", s_fcheight = " + FlxG.stage.fullScreenHeight);
			
			add(new FlxButton(80, 0, "Full", function():void {
				FlxG.fullscreen();
			}));
		}
		
		private function onDevicesChanged():void {
			var i:int;
			
			// Devices have changed, list them
			FlxG.log("The list of game input devices has changed. Total devices: " + mBinder.getNumDevices());

			// Trace info
			for (i = 0; i < mBinder.getNumDevices(); i++) {
				var aDevice :GameInputDevice = mBinder.getDeviceAt(i);
				
				FlxG.log("  " + i + ": " + (aDevice != null ? aDevice.name + "," + aDevice.id : "null"));
			}
		}

		private function onActionValueChanged(__action:String, __value:Number):void {
			//FlxG.log("The user activated the " + __action + " action's value. The new value is " + __value);
		}

		private function onActionActivated(__action:String):void {
			//FlxG.log("The user activated the " + __action + " action by pressing a key or button.");
		}

		private function onActionDeactivated(__action:String):void {
			//FlxG.log("The user deactivated the " + __action + " action by releasing a key or button.");
		}
		
		override public function update():void {
			super.update();
			
			var aText :String = "";
			
			aText += "CONTROL_LB = " + mBinder.isActionActivated("CONTROL_LB").toString() + "\n";
			aText += "CONTROL_RB = " + mBinder.isActionActivated("CONTROL_RB").toString() + "\n";
			aText += "CONTROL_LT = " + mBinder.isActionActivated("CONTROL_LT").toString() + "\n";
			aText += "CONTROL_RT = " + mBinder.isActionActivated("CONTROL_RT").toString() + "\n";
			aText += "CONTROL_DU = " + mBinder.isActionActivated("CONTROL_DU").toString() + "\n";
			aText += "CONTROL_DD = " + mBinder.isActionActivated("CONTROL_DD").toString() + "\n";
			aText += "CONTROL_DL = " + mBinder.isActionActivated("CONTROL_DL").toString() + "\n";
			aText += "CONTROL_DR = " + mBinder.isActionActivated("CONTROL_DR").toString() + "\n";
			aText += "CONTROL_AU = " + mBinder.isActionActivated("CONTROL_AU").toString() + "\n";
			aText += "CONTROL_AD = " + mBinder.isActionActivated("CONTROL_AD").toString() + "\n";
			aText += "CONTROL_AL = " + mBinder.isActionActivated("CONTROL_AL").toString() + "\n";
			aText += "CONTROL_AR = " + mBinder.isActionActivated("CONTROL_AR").toString() + "\n";
			aText += "CONTROL_SL_X = " + mBinder.isActionActivated("CONTROL_SL_X").toString() + "\n";
			aText += "CONTROL_SL_Y = " + mBinder.isActionActivated("CONTROL_SL_Y").toString() + "\n";
			aText += "CONTROL_SL_V = " + mBinder.isActionActivated("CONTROL_SL_V").toString() + "\n";
			aText += "CONTROL_SR_X = " + mBinder.isActionActivated("CONTROL_SR_X").toString() + "\n";
			aText += "CONTROL_SR_Y = " + mBinder.isActionActivated("CONTROL_SR_Y").toString() + "\n";
			aText += "CONTROL_SR_V = " + mBinder.isActionActivated("CONTROL_SR_V").toString() + "\n";
			aText += "CONTROL_MSELECT = " + mBinder.isActionActivated("CONTROL_MSELECT").toString() + "\n";
			aText += "CONTROL_MBACK = " + mBinder.isActionActivated("CONTROL_MSTART").toString() + "\n";
			aText += "CONTROL_MSTART = " + mBinder.isActionActivated("CONTROL_LB").toString() + "\n";
			aText += "CONTROL_MMENU = " + mBinder.isActionActivated("CONTROL_MMENU").toString() + "\n";
			aText += "CONTROL_MOPTIONS = " + mBinder.isActionActivated("CONTROL_MOPTIONS").toString() + "\n";
			aText += "CONTROL_MTRACKPAD = " + mBinder.isActionActivated("CONTROL_MTRACKPAD").toString() + "\n";
			aText += "CONTROL_MSHARE = " + mBinder.isActionActivated("CONTROL_MSHARE").toString() + "\n";
			
			mText.text = aText;
		}
	}
}