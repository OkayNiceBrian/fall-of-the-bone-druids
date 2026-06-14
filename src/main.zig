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

    const bgImg = try rl.loadTexture("assets/bg.jpg");
    defer rl.unloadTexture(bgImg);

    while (!rl.windowShouldClose()) {
        rl.beginDrawing();
        defer rl.endDrawing();

        rl.clearBackground(rl.Color.black);

        //INPUT

        //UPDATE

        //DRAW
        rl.drawTexture(bgImg, 0, 0, rl.Color.white);
    }
}
