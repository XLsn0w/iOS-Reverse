#import "SKTintedControlCell.h"
#import "common.h"

@implementation SKTintedControlCell

- (void) layoutSubviews {
	[super layoutSubviews];
    if ([self respondsToSelector:@selector(tintColor)])
        if (![self.tintColor _isSimilarToColor:SYSTEM_TINT withinPercentage:0.1])
            self.textLabel.textColor = self.tintColor;
}

@end