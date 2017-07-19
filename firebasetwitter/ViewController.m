//
//  ViewController.m
//  firebasetwitter
//
//  Created by PIPL-01 on 18/07/17.
//  Copyright © 2017 Hitesh_iOScom.employee. All rights reserved.
//

#import "ViewController.h"
#import <TwitterKit/TwitterKit.h>
#import "Firebase.h"
@interface ViewController ()
    {
     //   FIRAuthCredential *credential;
    }
@property (strong, nonatomic) IBOutlet UILabel *lblmsg;
@property (strong, nonatomic) IBOutlet UITextField *txtusername;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 _lblmsg.hidden=YES;
        // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)btnLoginClick:(id)sender {
    
    [[Twitter sharedInstance] logInWithCompletion:^
     (TWTRSession *session, NSError *error) {
         if (session) {
           //  NSLog(@"signed in as %@", [session userName]);
          //   NSLog(@"signed in as %@", [session userID]);
             _txtusername.text=[session userName];
             _lblmsg.hidden=NO;
           // [LoginButton setTitle:@"LogOut" forState:normal];
             
         } else {
             NSLog(@"error: %@", [error localizedDescription]);
         }
     }];  //  logInButton.center = self.view.center;
    
   
}

- (IBAction)btnLogoutClick:(id)sender {
    

    NSString *signedInUserID = [TWTRAPIClient clientWithCurrentUser].userID;
    if (signedInUserID) {
       
        TWTRSessionStore *store = [[Twitter sharedInstance] sessionStore];
      _txtusername.placeholder=@"username";
 _txtusername.text=@"";
       [store logOutUserID:signedInUserID];
        _lblmsg.hidden=NO;
        _lblmsg.text=@"You are successfully logged out";
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
