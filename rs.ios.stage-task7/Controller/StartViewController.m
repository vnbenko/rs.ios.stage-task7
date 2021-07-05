//
//  StartViewController.m
//  rs.ios.stage-task7
//
//  Created by Meraki on 05.07.2021.
//

#import "StartViewController.h"
#import "CustomTextField.h"
#import "CustomAuthButton.h"
#import "CustomSecureButton.h"

@interface StartViewController ()
@property (weak, nonatomic) IBOutlet CustomTextField *loginTextField;
@property (weak, nonatomic) IBOutlet CustomTextField *passwordTextField;
@property (weak, nonatomic) IBOutlet CustomAuthButton *authorizeButton;
@property (weak, nonatomic) IBOutlet UIView *secureView;
@property (weak, nonatomic) IBOutlet UILabel *secureCodeLabel;
@property (weak, nonatomic) IBOutlet CustomSecureButton *firstSecureButton;
@property (weak, nonatomic) IBOutlet CustomSecureButton *secondSecureButton;
@property (weak, nonatomic) IBOutlet CustomSecureButton *thirdSecureButton;

@end

@implementation StartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configure];
}

- (IBAction)loginEditingDidBegin:(CustomTextField *)sender {
    [sender setState:@"appear"];
}

//MARK: - First step of Authorization
- (IBAction)authorizeButtonTapped:(CustomAuthButton *)sender {
    NSString *correctLogin = @"username";
    NSString *correctPassword = @"password";
    BOOL isCorrect = ([self.loginTextField.text isEqualToString:correctLogin] && [self.passwordTextField.text isEqualToString:correctPassword]);
    
    [self hideKeyboard];
    if ([self.loginTextField.text isEqualToString:correctLogin]) {
        [self.loginTextField setState:@"correct"];
    } else {
        [self.loginTextField setState:@"error"];
    }
    
    if ([self.passwordTextField.text isEqualToString:correctPassword]) {
        [self.passwordTextField setState:@"correct"];
    } else {
        [self.passwordTextField setState:@"error"];
    }
    
    if (isCorrect) {
        [self authorizationComplete];
    }
}

- (void) authorizationComplete {
    [self.loginTextField setEnabled:NO];
    [self.passwordTextField setEnabled:NO];
    [self.authorizeButton setEnabled:NO];
    [self.secureView setHidden:NO];
    
    [self.loginTextField setAlpha:0.5];
    [self.passwordTextField setAlpha:0.5];
    [self.authorizeButton setAlpha:0.5];
}

//MARK: - Second step of Authorization
- (IBAction)secureButtonTapped:(CustomSecureButton *)sender {
    //Create formatter
    NSNumberFormatter *formatter = [NSNumberFormatter new];
    formatter.numberStyle = NSNumberFormatterDecimalStyle;
    NSNumber* senderValue = [formatter numberFromString:sender.titleLabel.text];
    [self.securityCodeArray addObject: senderValue];
    
    //check
    if (self.securityCodeArray.count == 1) {
        self.secureCodeLabel.text = @" ";
    }
    
    [self.secureCodeLabel setText:[self.secureCodeLabel.text stringByAppendingFormat: @"%d ", senderValue.intValue]];
    
    if (self.securityCodeArray.count == 3) {
        UIColor *incorrect = [UIColor colorNamed:@"Venetian Red"];
        UIColor *correct = [UIColor colorNamed:@"Turquoise Green"];
        
        if ([self.securityCodeArray isEqualToArray:@[@1, @3, @2]]) {
            [self.secureView.layer setBorderColor:correct.CGColor];
            [self showAlert];
        } else {
            [self.secureView.layer setBorderColor:incorrect.CGColor];
            self.secureCodeLabel.text = @"_";
            [self.securityCodeArray removeAllObjects];
        }
    } else {
        [self.secureView.layer setBorderColor:[UIColor clearColor].CGColor];
    }
}

//MARK: - Create Alert Controller
- (void)showAlert {
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"Welcome"
                                                                     message:@"You are successfuly authorized!" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *refresh = [UIAlertAction actionWithTitle:@"Refresh"
                                                      style:UIAlertActionStyleDestructive
                                                    handler:^(UIAlertAction * _Nonnull action) {
        [self resetToDefault];
    }];
    
    [alertVC addAction:refresh];
    [self presentViewController:alertVC animated:YES completion:nil];
}

//MARK: - Config
- (void)configure {
    //set delegates
    self.loginTextField.delegate = self;
    self.passwordTextField.delegate = self;
    
    //configure Secure View
    [self.secureView.layer setBorderWidth:2];
    [self.secureView.layer setBorderColor:[UIColor clearColor].CGColor];
    [self.secureView.layer setCornerRadius:10];
    
    //init securityCodeArray
    self.securityCodeArray = [NSMutableArray new];
    
    //configure keyboard hiding
    [self configureHidingKeyboardOnTap];
    
}

//MARK: - Hiding keyboard
- (void)configureHidingKeyboardOnTap {
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                 action:@selector(hideKeyboard)];
    [self.view addGestureRecognizer:tapGesture];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self hideKeyboard];
    return YES;
}

- (void)hideKeyboard {
    [self.view endEditing:YES];
}

//MARK: - Reset to default
- (void)resetToDefault {
    [self.secureView setHidden:YES];
    [self.secureView.layer setBorderColor:[UIColor clearColor].CGColor];
    
    [self.authorizeButton setEnabled:YES];
    [self.authorizeButton setAlpha:1];
    
    [self.loginTextField setState:@"appear"];
    self.loginTextField.text = @"";
    
    [self.passwordTextField setState:@"appear"];
    self.passwordTextField.text = @"";
    
    self.secureCodeLabel.text = @"_";
    
    [self.securityCodeArray removeAllObjects];
    
}

@end
