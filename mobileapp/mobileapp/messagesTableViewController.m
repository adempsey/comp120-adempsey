//
//  messagesTableViewController.m
//  mobileapp
//
//  Created by Andrew Dempsey on 11/5/13.
//  Copyright (c) 2013 Andrew Dempsey. All rights reserved.
//

#import "messagesTableViewController.h"

@interface messagesTableViewController ()
@property (weak, nonatomic) NSArray* messages;
@end

@implementation messagesTableViewController

- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    NSMutableURLRequest* request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:@"http://0.0.0.0:3000/messages.json"]];
    [request setHTTPMethod:@"GET"];
    NSError* error = nil;
    NSError* jsonError;
    
    NSData* messagesData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&error];
    self.messages = [NSJSONSerialization JSONObjectWithData:messagesData options:0 error:&jsonError];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}

@end
