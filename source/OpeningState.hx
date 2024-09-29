package;

import flixel.FlxG;
import flixel.FlxState;

import flixel.util.typeLimit.NextState;

import ui.PerfTracker;

class OpeningState extends FlxState
{
    public var nextState:NextState;

    public function new(nextState:NextState):Void
    {
        super();

        this.nextState = nextState;
    }

    override function create():Void
    {
        super.create();

        #if !html5
            FlxG.autoPause = false;
        #end

        FlxG.fixedTimestep = false;

        FlxG.updateFramerate = Std.int(Math.max(FlxG.stage.window.displayMode.refreshRate, 144.0));

        FlxG.drawFramerate = Std.int(Math.min(FlxG.stage.window.displayMode.refreshRate, 144.0));

        FlxG.mouse.visible = false;

        var perfTracker:PerfTracker = new PerfTracker(10.0, 5.0);
        
        FlxG.game.addChild(perfTracker);

        FlxG.switchState(nextState);
    }
}