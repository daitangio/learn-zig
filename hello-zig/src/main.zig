const std = @import("std");

pub fn main() anyerror!void {
    std.log.info("All your codebase are belong to us.", .{});
    std.log.info("Just kidding, {s}", .{std});
}
