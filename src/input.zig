const rl = @import("raylib");

pub const InputHandler = struct {
    // pressed buttons
    leftPressed: bool = false,
    rightPressed: bool = false,
    upPressed: bool = false,
    downPressed: bool = false,
    aPressed: bool = false,
    bPressed: bool = false,
    xPressed: bool = false,
    yPressed: bool = false,
    lPressed: bool = false,
    rPressed: bool = false,
    zlPressed: bool = false,
    zrPressed: bool = false,
    startPressed: bool = false,
    selectPressed: bool = false,

    // tapped buttons
    leftTapped: bool = false,
    rightTapped: bool = false,
    upTapped: bool = false,
    downTapped: bool = false,
    aTapped: bool = false,
    bTapped: bool = false,
    xTapped: bool = false,
    yTapped: bool = false,
    lTapped: bool = false,
    rTapped: bool = false,
    zlTapped: bool = false,
    zrTapped: bool = false,
    startTapped: bool = false,
    selectTapped: bool = false,

    pub fn handleInput(self: @This()) void {
        self.resetTappedKeys();
        self.handlePresses();
        self.handleReleases();
    }

    // TODO: Make key bindings dynamic
    fn handlePresses(self: @This()) void {
        if (rl.isKeyPressed(rl.KeyboardKey.left)) {
            self.leftPressed = true;
            self.leftTapped = true;
        }

        if (rl.isKeyPressed(rl.KeyboardKey.right)) {
            self.rightPressed = true;
            self.rightTapped = true;
        }

        if (rl.isKeyPressed(rl.KeyboardKey.up)) {
            self.upPressed = true;
            self.upTapped = true;
        }

        if (rl.isKeyPressed(rl.KeyboardKey.down)) {
            self.downPressed = true;
            self.downTapped = true;
        }

        if (rl.isKeyPressed(rl.KeyboardKey.space)) {
            self.aPressed = true;
            self.aTapped = true;
        }

        if (rl.isKeyPressed(rl.KeyboardKey.left_shift)) {
            self.bPressed = true;
            self.bTapped = true;
        }
    }

    fn handleReleases(self: @This()) void {
        if (rl.isKeyReleased(rl.KeyboardKey.left)) {
            self.leftPressed = false;
        }

        if (rl.isKeyReleased(rl.KeyboardKey.right)) {
            self.rightPressed = false;
        }

        if (rl.isKeyReleased(rl.KeyboardKey.up)) {
            self.upPressed = false;
        }

        if (rl.isKeyReleased(rl.KeyboardKey.down)) {
            self.downPressed = false;
        }

        if (rl.isKeyReleased(rl.KeyboardKey.space)) {
            self.aPressed = false;
        }

        if (rl.isKeyReleased(rl.KeyboardKey.left_shift)) {
            self.bPressed = false;
        }
    }

    fn resetTappedKeys(self: @This()) void {
        self.leftTapped = false;
        self.rightTapped = false;
        self.upTapped = false;
        self.downTapped = false;
        self.aTapped = false;
        self.bTapped = false;
        self.xTapped = false;
        self.yTapped = false;
        self.lTapped = false;
        self.rTapped = false;
        self.zlTapped = false;
        self.zrTapped = false;
        self.startTapped = false;
        self.selectTapped = false;
    }
};