const rl = @import("raylib");
const Player = @import("player.zig").Player;
const std = @import("std");

pub const PlayerGraphics = struct {
    playerTexture: rl.Texture2D = undefined,
    playerRect: rl.Rectangle = rl.Rectangle{.x = 0, .y = 0, .width = 64, .height = 64},
    
    pub fn draw(self: *@This(), player: *Player) void {
        rl.drawTextureRec(
            self.playerTexture,
            self.playerRect, 
            player.position, 
            rl.Color.white
        );
    }

    pub fn loadTextures(self: *@This()) !void {
        self.playerTexture = try rl.loadTexture("assets/player/bonedruid.png");
    }

    pub fn unloadTextures(self: *@This()) void {
        rl.unloadTexture(self.playerTexture);
    }
};