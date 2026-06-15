const InputHandler = @import("input.zig").InputHandler;
const Timer = @import("time.zig").Timer;
const Player = @import("player/player.zig").Player;

pub const Game = struct {
    inputHandler: *InputHandler,
    timer: *Timer,

    player: Player,

    pub fn update(self: @This()) void {
        
    }

    pub fn draw(self: @This()) void {

    }
};