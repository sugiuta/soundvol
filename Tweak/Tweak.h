#import <UIKit/UIKit.h>

@interface SBApplication : NSObject
@property (nonatomic, copy, readonly) NSString *displayName;
@end

@interface SBMediaController : NSObject
+ (id)sharedInstance;
- (BOOL)isPlaying;
- (SBApplication *)nowPlayingApplication;
- (BOOL)playForEventSource:(long long)arg1;
- (BOOL)pauseForEventSource:(long long)arg1;
@end
