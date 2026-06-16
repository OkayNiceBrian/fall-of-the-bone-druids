const InputHandler = @import("input.zig").InputHandler;
const Timer = @import("time.zig").Timer;
const Player = @import("player/player.zig").Player;

pub const Game = struct {
    inputHandler: *InputHandler,
    timer: Timer = Timer{},

    player: Player = Player{},

    pub fn update(self: *@This()) void {
        self.player.update(self.inputHandler);
        
        // INCREMENT TIMER
        self.timer.increment();
    }

    pub fn draw(self: *@This()) void {
        self.player.draw();
    }

    pub fn load(self: *@This()) !void {
        try self.player.load();
    }

    pub fn unload(self: *@This()) void {
        self.player.unload();
    }
};