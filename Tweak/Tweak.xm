#import "Tweak.h"

BOOL soundEnabled = NO;

%hook SBVolumeControl
- (void)_updateEffectiveVolume:(float)arg1 {
	if ([[%c(SBMediaController) sharedInstance] nowPlayingApplication].displayName != nil) {
		if ([[%c(SBMediaController) sharedInstance] isPlaying] && arg1 == 0) {
			[[%c(SBMediaController) sharedInstance] pauseForEventSource:0];
			soundEnabled = YES;
		}
		if (![[%c(SBMediaController) sharedInstance] isPlaying] && arg1 != 0 && soundEnabled) {
			[[%c(SBMediaController) sharedInstance] playForEventSource:0];
			soundEnabled = NO;
		}
	}
    return %orig;
}
%end
