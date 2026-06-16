const rl = @import("raylib");
const PlayerGraphics = @import("playerGraphics.zig").PlayerGraphics;
const Size2D = @import("../geometry.zig").Size2D;
const InputHandler = @import("../input.zig").InputHandler;
const Timer = @import("../time.zig").Timer;

const jump_velocity: f32 = -20;
const gravity: f32 = 3;
const player_speed: f32 = 4;

pub const Player = struct {
    position: rl.Vector2 = rl.Vector2{.x = 250, .y = 250},
    size: Size2D = Size2D{.w = 32, .h = 64},

    jumpTimer: Timer = Timer{.frameCount = 9000},
    isAirborne: bool = false,
    xVelocity: f32 = 0,
    yVelocity: f32 = 0,

    graphics: PlayerGraphics = PlayerGraphics{},


    pub fn update(self: *@This(), ih: *InputHandler) void {
        
        if (self.position.y < 250) { // Temporary airborne check
            self.isAirborne = true;
        } 

        if (ih.leftPressed) {
            self.xVelocity = -player_speed;
        }
        if (ih.rightPressed) {
            self.xVelocity = player_speed;
        }
        if (ih.rightPressed == ih.leftPressed) {
            // Slow down, don't just stop immediately
            if (self.xVelocity != 0) {
                self.xVelocity -= (self.xVelocity / @abs(self.xVelocity)) * 1;
            }
        }
        
        if (!self.isAirborne) {
            if (ih.aTapped) {
                self.yVelocity = jump_velocity;
                self.isAirborne = true;
                self.jumpTimer.reset();
            }
        }

        if (self.isAirborne) {
            self.yVelocity += gravity;

            // longer you press jump, higher you jump up to a point
            if (ih.aPressed and self.jumpTimer.frameCount < 8) {
                self.yVelocity = jump_velocity;
            }

            if (gravity < 1) {
                gravity = 1;
            }

            if (self.position.y > 250 - self.yVelocity) {
                self.position.y = 250;
                self.yVelocity = 0;
                self.isAirborne = false;
            }

            if (self.jumpTimer.frameCount < 9000) {
                self.jumpTimer.increment();
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