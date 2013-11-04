//
//  ViewController.h
//  mobileapp
//
//  Created by Andrew Dempsey on 11/4/13.
//  Copyright (c) 2013 Andrew Dempsey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *username;
@property (strong, nonatomic) IBOutlet UITextField *message;
@property (strong, nonatomic) IBOutlet UILabel *messageStatus;

@end
