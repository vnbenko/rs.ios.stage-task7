//
//  StartViewController.h
//  rs.ios.stage-task7
//
//  Created by Meraki on 05.07.2021.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface StartViewController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) NSMutableArray<NSNumber *> *securityCodeArray;

@end

NS_ASSUME_NONNULL_END
