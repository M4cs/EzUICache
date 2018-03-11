#import "EzRespringModule.h"
#import <spawn.h>



@interface UIImage ()
+ (UIImage *)imageNamed:(NSString *)name inBundle:(NSBundle *)bundle;
@end

@implementation EzRespringModule
- (UIImage *)iconGlyph {
	return [UIImage imageNamed:@"Icon" inBundle:[NSBundle bundleForClass:[self class]]];
}

- (UIColor *)selectedColor {
	return [UIColor blueColor];
}

- (BOOL)isSelected {
	return self.EzRespring;
}

- (void)setSelected:(BOOL)selected {
	self.EzRespring = selected;
	[super refreshState];
    [self respring];
}

- (void)respring {
    pid_t pid;
    int status;
    const char* args[] = {"uicache.sh", NULL, NULL, NULL};
    posix_spawn(&pid, "/Library/ControlCenter/Bundles/EzUICache/uicache", NULL, NULL, (char* const*)args, NULL);
    waitpid(pid, &status, WEXITED);
}
@end
