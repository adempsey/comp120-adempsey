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

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sendMessage:(id)sender {
	__block UIActivityIndicatorView* indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
	[indicator startAnimating];
	indicator.frame = CGRectMake(
						  self.view.frame.size.width/2 - indicator.frame.size.width+12,
						  self.view.frame.size.height/2+48,
						  indicator.frame.size.width,
						  indicator.frame.size.height);
	indicator.autoresizingMask = UIViewAutoresizingNone;
	[self.view addSubview:indicator];
	self.messageStatus.text = @"";
	
    NSMutableURLRequest* messagerequest = [[NSMutableURLRequest alloc] init];
    [messagerequest setURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://0.0.0.0:3000/messages"]]];
    [messagerequest setHTTPMethod:@"POST"];
    NSString *postData = [NSString stringWithFormat:@"message[username]=%@&message[content]=%@&message[app_id]=1", self.username.text, self.message.text];
    [messagerequest setHTTPBody:[postData dataUsingEncoding:NSUTF8StringEncoding]];
    
    [NSURLConnection sendAsynchronousRequest:messagerequest
                                       queue:[[NSOperationQueue alloc] init]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
							   NSInteger statusCode = [(NSHTTPURLResponse*)response statusCode];
                               if (connectionError || statusCode!=200) {
								   dispatch_async(dispatch_get_main_queue(), ^{
									   self.messageStatus.textColor = [UIColor redColor];
									   self.messageStatus.text = @"Error sending message";
									   [indicator removeFromSuperview];
								   });
                               } else {
								   dispatch_async(dispatch_get_main_queue(), ^{
									   self.messageStatus.textColor = [UIColor greenColor];
									   self.messageStatus.text = @"Message sent successfully";
									   [indicator removeFromSuperview];
								   });
							   }
                           }];
    [self dismissKeyboard];
}

- (void)dismissKeyboard {
    [self.view endEditing:YES];
}

@end
