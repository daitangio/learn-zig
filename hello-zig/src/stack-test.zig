const std = @import("std");

fn Stack(comptime T: type) type {
    return struct {
        const This=@This();
        const Item=struct {
            item: T,
            next: ?*Item
        };
        alloc: *std.mem.Allocator,
        top: ?*Item,
        pub fn init(alloc: *std.mem.Allocator) This {
            return This{
                .alloc = alloc,
                .top =null,
            };
        }
        pub fn push(this: *This, value: T) !void {
            std.log.info("Pushing {}", .{value});
            const node = try this.alloc.create(Item);
            node.* = .{ .item = value, .next=this.top };            
            this.top=node;
            // return this;
        }
    };          
}

test "Stack Abstraction" {
    var s1=Stack(i32).init(std.testing.allocator);
    try s1.push(3);

}