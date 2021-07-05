//
//  CustomAuthButton.m
//  rs.ios.stage-task7
//
//  Created by Meraki on 05.07.2021.
//

#import "CustomAuthButton.h"

@implementation CustomAuthButton

- (void)awakeFromNib {
    [super awakeFromNib];
    [self configure];
}

- (void)configure {
    UIColor *color = [UIColor colorNamed:@"Little Boy Blue"];
    UIImage *person = [UIImage imageNamed:@"person"];
    UIImage *personFill = [UIImage imageNamed:@"personfill"];
    
    //set button border
    [self.layer setBorderColor:color.CGColor];
    [self.layer setBorderWidth:2];
    [self.layer setCornerRadius:10];
    self.clipsToBounds = TRUE;
    
    //set icon of auth button
    [self setImage:person forState:UIControlStateNormal];
    [self setImage:personFill forState:UIControlStateHighlighted];
    [self setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 5)];
}

- (void)setHighlighted:(BOOL)highlighted {
    [super setHighlighted:highlighted];
    UIColor *color = [UIColor colorNamed:@"Little Boy Blue"];
    
    if (highlighted) {
        self.backgroundColor = [color colorWithAlphaComponent:0.2];
    } else {
        self.backgroundColor = [UIColor whiteColor];
    }
    
}
@end
