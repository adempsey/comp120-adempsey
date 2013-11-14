//
//  messagesTableViewController.m
//  mobileapp
//
//  Created by Andrew Dempsey on 11/5/13.
//  Copyright (c) 2013 Andrew Dempsey. All rights reserved.
//

#import "messagesTableViewController.h"

@interface messagesTableViewController ()
@property (strong) __block NSMutableArray* messages;
@end

@implementation messagesTableViewController

- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
	[self.messages removeAllObjects];
	[self.tableView reloadData];
	
	__block UIActivityIndicatorView* indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
	[indicator startAnimating];
	indicator.frame = CGRectMake(
								 self.view.frame.size.width/2 - indicator.frame.size.width+12,
								 self.view.frame.size.height/2+48,
								 indicator.frame.size.width,
								 indicator.frame.size.height);
	indicator.autoresizingMask = UIViewAutoresizingNone;
	[self.view addSubview:indicator];
	
    NSMutableURLRequest* request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:@"http://0.0.0.0:3000/messages.json"]];
    [request setHTTPMethod:@"GET"];
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[[NSOperationQueue alloc] init]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                               if (connectionError) {
                                   NSLog(@"Error");
                               } else {
                                   self.messages = [NSMutableArray arrayWithArray:[NSJSONSerialization JSONObjectWithData:data options:0 error:nil]];
								   dispatch_async(dispatch_get_main_queue(), ^{
									   [indicator removeFromSuperview];
									   [self.tableView reloadData];
								   });
                               }
                           }];
	
}

- (void)didReceiveMemoryWarning {
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
