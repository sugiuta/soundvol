#import "Tweak.h"

%hook SBVolumeControl
- (void)_updateEffectiveVolume:(float)arg1 {
	if ([[%c(SBMediaController) sharedInstance] nowPlayingApplication].displayName != nil) {
		if ([[%c(SBMediaController) sharedInstance] isPlaying] && arg1 == 0) [[%c(SBMediaController) sharedInstance] pauseForEventSource:0];
		else [[%c(SBMediaController) sharedInstance] playForEventSource:0];
	}
    return %orig;
}
%end
