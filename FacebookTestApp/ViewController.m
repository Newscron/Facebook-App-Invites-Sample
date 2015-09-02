//
//  ViewController.m
//  FacebookTestApp
//
//  Created by Domagoj Kulundzic on 01/09/15.
//  Copyright (c) 2015 Domagoj Kulundzic. All rights reserved.
//

#import "ViewController.h"
#import <FBSDKShareKit/FBSDKShareKit.h>

@interface ViewController () <FBSDKAppInviteDialogDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 *  The code in this method is exact as used in the real App.
 *
 *  @param sender N/A
 */
- (IBAction)buttonFacebookInviteTapped:(UIButton *)sender {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    
    // The URL created via the App Invites quickstart.
    NSURL *url = [NSURL URLWithString:@"https://fb.me/1650172178559910"];
    
    FBSDKAppInviteContent *content = [[FBSDKAppInviteContent alloc] init];
    
    content.appLinkURL = url;
    content.appInvitePreviewImageURL = [NSURL URLWithString:@"https://niu.ws/images/menu-logo-mobile.png"];
    
    if([[[FBSDKAppInviteDialog alloc] init] canShow]) {
        NSLog(@"Showing the FacebookAppInviteDialog.");
        [FBSDKAppInviteDialog showWithContent:content
                                     delegate:self];
    } else {
        NSLog(@"Cannot show the FacebookAppInviteDialog.");
    }
}

- (void)appInviteDialog:(FBSDKAppInviteDialog *)appInviteDialog didCompleteWithResults:(NSDictionary *)results {
    NSLog(@"%s%@", __PRETTY_FUNCTION__, results);
}

- (void)appInviteDialog:(FBSDKAppInviteDialog *)appInviteDialog didFailWithError:(NSError *)error {
    NSLog(@"%s%@", __PRETTY_FUNCTION__, error.localizedDescription);
}

@end
