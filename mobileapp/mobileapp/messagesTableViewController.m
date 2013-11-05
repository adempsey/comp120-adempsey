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
    NSError* jsonError = nil;
    
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.messages count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = [[self.messages objectAtIndex:indexPath.row] objectForKey:@"content"];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Posted by %@", [[self.messages objectAtIndex:indexPath.row] objectForKey:@"username"]];
    
    return cell;
}

@end
