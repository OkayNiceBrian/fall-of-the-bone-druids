const Size2D = @import("geometry.zig").Size2D;

pub const GameConfig = struct {
    fps: f32 = 60,
    v_screenSize: Size2D = Size2D{ .w = 640, .h = 360 },
    screenScale: u32 = 3,
    gameTitle: *const [40:0]u8 = "Bone Theory: The Fall of the Bone Druids"
}; 