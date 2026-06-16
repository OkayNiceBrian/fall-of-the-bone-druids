const std = @import("std");
const Io = std.Io;

const rl = @import("raylib");

const bt = @import("fall_of_the_bone_druids");
const GameConfig = bt.GameConfig;
const InputHandler = bt.Input.InputHandler;
const Timer = bt.Time.Timer;
const Game = bt.Game.Game;

pub fn main(init: std.process.Init) !void {
    const gameConfig = GameConfig{};
    const screenWidth: u32 = gameConfig.v_screenSize.w * gameConfig.screenScale;
    const screenHeight: u32 = gameConfig.v_screenSize.h * gameConfig.screenScale;
    // Prints to stderr, unbuffered, ignoring potential errors.
    std.debug.print("Starting... {s}.\n", .{gameConfig.gameTitle});

    // This is appropriate for anything that lives as long as the process.
    const arena: std.mem.Allocator = init.arena.allocator();

    // Accessing command line arguments:
    const args = try init.minimal.args.toSlice(arena);
    for (args) |arg| {
        std.log.info("arg: {s}", .{arg});
    }

    // Create Window
    rl.initWindow(screenWidth, screenHeight, gameConfig.gameTitle);
    defer rl.closeWindow();

    rl.setTargetFPS(gameConfig.fps);

    // SETUP the virtual rendering situation
    const renderTexture: rl.RenderTexture2D = try rl.loadRenderTexture(gameConfig.v_screenSize.w, gameConfig.v_screenSize.h);
    const renderTextureSrc: rl.Rectangle = rl.Rectangle{.x = 0, .y = 0, .width = gameConfig.v_screenSize.w, .height = -gameConfig.v_screenSize.h};
    const renderTextureDest: rl.Rectangle = rl.Rectangle{.x = 0, .y = 0, .width = screenWidth, .height = screenHeight};
    const renderTextureOrig: rl.Vector2 = rl.Vector2{.x = 0, .y = 0};
    defer rl.unloadRenderTexture(renderTexture);

    // SETUP top-level objects
    var globalTimer = Timer{};
    var ih = InputHandler{};
    var game = Game{.inputHandler = &ih};
    
    try game.load();
    defer game.unload();

    // LOOP
    while (!rl.windowShouldClose()) {
        
        //INPUT
        ih.handleInput();

        //UPDATE
        game.update();

        //DRAW
        // draw onto virtual screen to be upscaled
        rl.beginTextureMode(renderTexture);
        rl.clearBackground(rl.Color.black);
        game.draw();
        rl.endTextureMode();

        // draw onto upscaled screen
        rl.beginDrawing();
        rl.clearBackground(rl.Color.black);
        rl.drawTexturePro(renderTexture.texture, renderTextureSrc, renderTextureDest, renderTextureOrig, 0, rl.Color.white);
        rl.endDrawing();

        // TIMER INCREMENT
        globalTimer.increment();
    }
}
