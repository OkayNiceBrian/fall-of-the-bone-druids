const rl = @import("raylib");
const PlayerGraphics = @import("playerGraphics.zig").PlayerGraphics;
const Size2D = @import("../geometry.zig").Size2D;
const InputHandler = @import("../input.zig").InputHandler;

pub const Player = struct {
    position: rl.Vector2 = rl.Vector2{.x = 250, .y = 250},
    size: Size2D = Size2D{.w = 32, .h = 64},

    isAirborne: bool = false,
    xVelocity: f32 = 0,
    yVelocity: f32 = 0,

    graphics: PlayerGraphics = PlayerGraphics{},

    speed: f32 = 4,

    pub fn update(self: *@This(), ih: *InputHandler) void {
        
        if (self.position.y < 250) { // Temporary airborne check
            self.isAirborne = true;
        } 

        if (ih.leftPressed) {
            self.xVelocity = -self.speed;
        }
        if (ih.rightPressed) {
            self.xVelocity = self.speed;
        }
        if (ih.rightPressed == ih.leftPressed) {
            self.xVelocity = 0;
        }
        
        if (!self.isAirborne) {
            if (ih.aPressed) {
                self.yVelocity = -18;
            }
        }

        if (self.isAirborne) {
            self.yVelocity += 1;

            if (self.position.y > 250 - self.yVelocity) {
                self.position.y = 250;
                self.yVelocity = 0;
                self.isAirborne = false;
            }
        }

        self.position.x += self.xVelocity;
        self.position.y += self.yVelocity;
    }

    pub fn draw(self: *@This()) void {
        self.graphics.draw(self);
    }

    pub fn load(self: *@This()) !void {
        try self.graphics.loadTextures();
    }

    pub fn unload(self: *@This()) void {
        self.graphics.unloadTextures();
    }
};