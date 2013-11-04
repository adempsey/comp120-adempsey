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
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sendMessage:(id)sender {
    NSMutableURLRequest* messagerequest = [[NSMutableURLRequest alloc] init];
    [messagerequest setURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://localhost:3000"]]];
    [messagerequest setHTTPMethod:@"POST"];
    [messagerequest setValue:self.username.text forHTTPHeaderField:@"username"];
    [messagerequest setValue:self.message.text forHTTPHeaderField:@"message"];
    [messagerequest setValue:@"1" forHTTPHeaderField:@"app_id"];
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
}

//NSMutableURLRequest* request = [[NSMutableURLRequest alloc] init];
//[request setURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://api.twitter.com/1.1/trends/place.json?id=%@&exclude=hashtags",woeid]]];
//[request setHTTPMethod:@"GET"];
//[request setValue:BEARER forHTTPHeaderField:@"Authorization"];
//NSError* error = nil;
//
//NSData* data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&error];
////    NSLog(@"%@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
//
//if (error) {
//    NSLog(@"error loading trends");
//} else {
//    NSError* jsonError;
//    id jsonData = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
//    NSDictionary* twitterData = ([jsonData isKindOfClass:[NSArray class]])?[jsonData objectAtIndex:0]:jsonData;
//    if (jsonError) {
//        NSLog(@"json error");
//    } else {
//        self.trends = [twitterData objectForKey:@"trends"];
//        self.date = [twitterData objectForKey:@"created_at"];
//        self.location = [[[twitterData objectForKey:@"locations"] objectAtIndex:0] objectForKey:@"name"];
//        self.woeid = [[[twitterData objectForKey:@"woeid"] objectAtIndex:0] objectForKey:@"woeid"];
//    }
//}


@end
