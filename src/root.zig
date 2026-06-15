//! By convention, root.zig is the root source file when making a package.
const std = @import("std");
const Io = std.Io;
pub const GameConfig = @import("config.zig").GameConfig;
pub const Rectangle = @import("geometry.zig").Rectangle;
pub const Vector2D = @import("geometry.zig").Vector2D;
pub const Game = @import("game.zig");
pub const Player = @import("player/player.zig");

/// This is a documentation comment to explain the `printAnotherMessage` function below.
///
/// Accepting an `Io.Writer` instance is a handy way to write reusable code.
pub fn printAnotherMessage(writer: *Io.Writer) Io.Writer.Error!void {
    try writer.print("Run `zig build test` to run the tests.\n", .{});
}

pub fn add(a: i32, b: i32) i32 {
    return a + b;
}

test "basic add functionality" {
    try std.testing.expect(add(3, 7) == 10);
}
