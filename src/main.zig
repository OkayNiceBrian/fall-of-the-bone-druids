const std = @import("std");
const Io = std.Io;

const rl = @import("raylib");

const bt = @import("fall_of_the_bone_druids");
const GameConfig = bt.GameConfig;

pub fn main(init: std.process.Init) !void {
    const gameConfig = GameConfig{};
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
    rl.initWindow(gameConfig.screenSize.w, gameConfig.screenSize.h, gameConfig.gameTitle);
    defer rl.closeWindow();

    rl.setTargetFPS(gameConfig.fps);

    // set up background, testing
    var bgImg = try rl.loadImage("assets/bg.png");
    defer rl.unloadImage(bgImg);
    bgImg.resize(gameConfig.screenSize.w, gameConfig.screenSize.h);
    const bgTexture = try rl.loadTextureFromImage(bgImg);
    defer rl.unloadTexture(bgTexture);

    // LOOP
    while (!rl.windowShouldClose()) {
        rl.beginDrawing();
        defer rl.endDrawing();

        rl.clearBackground(rl.Color.black);

        //INPUT

        //UPDATE

        //DRAW
        rl.drawTexture(bgTexture, 0, 0, rl.Color.white);
    }
}
