const Size2D = @import("geometry.zig").Size2D;

pub const GameConfig = struct {
    fps: f32 = 144,
    screenSize: Size2D = Size2D{ .w = 1920, .h = 1080 },
    gameTitle: *const [40:0]u8 = "Bone Theory: The Fall of the Bone Druids"
};