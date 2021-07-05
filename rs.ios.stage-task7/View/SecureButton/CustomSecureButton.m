//
//  CustomSecureButton.m
//  rs.ios.stage-task7
//
//  Created by Meraki on 05.07.2021.
//

#import "CustomSecureButton.h"

@implementation CustomSecureButton

- (void)awakeFromNib {
    [super awakeFromNib];
    [self configure];
}

- (void)configure {
    UIColor *color = [UIColor colorNamed:@"Little Boy Blue"];
    [self.layer setBorderWidth:1.5];
    [self.layer setBorderColor:color.CGColor];
    [self.layer setCornerRadius:25];
}

@end
