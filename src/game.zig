const InputHandler = @import("input.zig").InputHandler;
const Timer = @import("time.zig").Timer;
const Player = @import("player/player.zig").Player;

pub const Game = struct {
    inputHandler: *InputHandler,
    timer: Timer = Timer{},

    player: Player,

    pub fn update(self: @This()) void {
        
        
        // INCREMENT TIMER
        self.timer.increment();
    }

    pub fn draw(self: @This()) void {

    }
};