
package;

import flixel.FlxState;
import flixel.FlxSprite;
import flixel.FlxG;

class PlayState extends FlxState {
    var player:FlxSprite;

    override public function create() {
        super.create();
        player = new FlxSprite(100, 100);
        player.makeGraphic(32, 32, 0xFF00FF00);
        add(player);
    }

    override public function update(elapsed:Float) {
        super.update(elapsed);
        if (FlxG.keys.pressed.LEFT) player.x -= 200 * elapsed;
        if (FlxG.keys.pressed.RIGHT) player.x += 200 * elapsed;
        if (FlxG.keys.pressed.UP) player.y -= 200 * elapsed;
        if (FlxG.keys.pressed.DOWN) player.y += 200 * elapsed;
    }
}
