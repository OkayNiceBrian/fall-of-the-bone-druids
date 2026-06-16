
pub const Timer = struct {
    frameCount: u32 = 0,

    pub fn increment(self: *@This()) void {
        self.frameCount += 1;
    }

    pub fn reset(self: *@This()) void {
        self.frameCount = 0;
    }
};