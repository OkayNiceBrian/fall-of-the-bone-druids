/// 2D Size
/// Fields:
/// - width: u32
/// - height: u32
pub const Size2D = struct { w: u32, h: i32 };

/// 2D Vector
/// Fields:
/// - x: i32
/// - y: i32
pub const Vector2D = struct { x: i32, y: i32 };

/// Rectangle
/// Fields:
/// - position: Vector2D
/// - size: Size2D
pub const Rectangle = struct {
    position: Vector2D,
    size: Size2D,
    
    pub fn init(position: Vector2D, size: Size2D) Rectangle {
        const self: Rectangle = Rectangle{.position = position, .size = size};
        return self;
    }

    pub fn initPrimitives(x: i32, y: i32, w: u32, h: u32) Rectangle {
        const position = Vector2D{.x = x, .y = y};
        const size = Size2D{.w = w, .h = h};
        const self: Rectangle = Rectangle{.position = position, .size = size};
        return self;
    }

    pub fn X(self: Rectangle) i32 {
        return self.position.x;
    }

    pub fn Y(self: Rectangle) i32 {
        return self.position.y;
    }
    
    pub fn W(self: Rectangle) u32 {
        return self.size.w;
    }

    pub fn H(self: Rectangle) u32 {
        return self.size.h;
    }

    pub fn isColliding(self: Rectangle, other: Rectangle) bool {
        return self.position.x + self.size.w > other.position.x
        and self.position.x + self.size.w < other.position.x + other.size.w
        and self.position.y + self.size.h > other.position.y
        and self.position.y + self.size.h < other.position.y + other.size.h;
    }
};
