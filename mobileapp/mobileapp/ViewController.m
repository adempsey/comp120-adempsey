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
	__block UIActivityIndicatorView* iv = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
	[iv startAnimating];
	iv.frame = CGRectMake(
						  self.view.frame.size.width/2 - iv.frame.size.width+12,
						  self.view.frame.size.height/2+48,
						  iv.frame.size.width,
						  iv.frame.size.height );
	iv.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin;
	[self.view addSubview:iv];
	self.messageStatus.text = @"";
	
    NSMutableURLRequest* messagerequest = [[NSMutableURLRequest alloc] init];
    [messagerequest setURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://0.0.0.0:3000/messages"]]];
    [messagerequest setHTTPMethod:@"POST"];
    NSString *postData = [NSString stringWithFormat:@"message[username]=%@&message[content]=%@&message[app_id]=1", self.username.text, self.message.text];
    [messagerequest setHTTPBody:[postData dataUsingEncoding:NSUTF8StringEncoding]];
    
    [NSURLConnection sendAsynchronousRequest:messagerequest
                                       queue:[[NSOperationQueue alloc] init]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                               if (connectionError) {
								   dispatch_async(dispatch_get_main_queue(), ^{
									   self.messageStatus.textColor = [UIColor redColor];
									   self.messageStatus.text = @"Error sending message";
									   [iv removeFromSuperview];
								   });
                               } else {
								   dispatch_async(dispatch_get_main_queue(), ^{
									   self.messageStatus.textColor = [UIColor greenColor];
									   self.messageStatus.text = @"Message sent successfully";
									   [iv removeFromSuperview];
								   });
							   }
                           }];
    [self dismissKeyboard];
}

- (void)dismissKeyboard {
    [self.view endEditing:YES];
}

@end
