//
//  ViewController.m
//  mobileapp
//
//  Created by Andrew Dempsey on 11/4/13.
//  Copyright (c) 2013 Andrew Dempsey. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sendMessage:(id)sender {
    NSMutableURLRequest* messagerequest = [[NSMutableURLRequest alloc] init];
    [messagerequest setURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://0.0.0.0:3000/messages"]]];
    [messagerequest setHTTPMethod:@"POST"];
    NSString *postData = [NSString stringWithFormat:@"message[username]=%@&message[content]=%@&message[app_id]=1", self.username.text, self.message.text];
    [messagerequest setHTTPBody:[postData dataUsingEncoding:NSUTF8StringEncoding]];
    NSError* error = nil;
    
    NSData* data = [NSURLConnection sendSynchronousRequest:messagerequest returningResponse:nil error:&error];
    if (error) {
        self.messageStatus.textColor = [UIColor redColor];
        self.messageStatus.text = @"Error sending message";
    } else {
        self.messageStatus.textColor = [UIColor greenColor];
        self.messageStatus.text = @"Message sent successfully";
    }
    (void) data;
    [self dismissKeyboard];
}

- (void)dismissKeyboard {
    [self.view endEditing:YES];
}

@end
