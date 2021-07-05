//
//  CustomTextField.m
//  rs.ios.stage-task7
//
//  Created by Meraki on 05.07.2021.
//

#import "CustomTextField.h"

@implementation CustomTextField

- (void)awakeFromNib {
    [super awakeFromNib];
    [self configure];
    [self setState:@"ready"];
}

- (void)configure {
    [self.layer setCornerRadius:5];
    [self.layer setBorderWidth:1.5];
}

- (void)setState:(NSString *)state {
    UIColor *appear = [UIColor colorNamed:@"Black Coral"];
    UIColor *correct = [UIColor colorNamed:@"Turquoise Green"];
    UIColor *error = [UIColor colorNamed:@"Venetian Red"];
    
    if ([state isEqualToString:@"ready"]) {
        [self setEnabled:YES];
        [self.layer setBorderColor:appear.CGColor];
        [self setAlpha:1];
    } else if ([state isEqualToString:@"success"]) {
        [self.layer setBorderColor:correct.CGColor];
    } else if ([state isEqualToString:@"error"]) {
        [self.layer setBorderColor:error.CGColor];
    } 
}

@end
