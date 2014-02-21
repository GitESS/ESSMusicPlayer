//  ConsoleViewController.m
//  AppLinkTester
//  Copyright (c) 2012 Ford Motor Company. All rights reserved.

#import "ConsoleViewController.h"
#import "SyncBrain.h"


@interface ConsoleViewController ()
-(void) postConsoleController:(NSNotification *)notif;
-(void) postConsoleControllerMainThread:(NSNotification *)notif;
@end

@implementation ConsoleViewController
@synthesize consoleView;



-(void) logInfo:(NSString*) info {
	[consoleController appendString:info];
}

-(void) logException:(NSException*) ex withMessage:(NSString*) message {
	[consoleController appendString:message];
}

-(void) postConsoleControllerMainThread:(NSNotification *)notif {
    [consoleController appendMessage:[notif object]];

}

-(void) postConsoleController:(NSNotification *)notif{
    [self performSelectorOnMainThread:@selector(postConsoleControllerMainThread:) withObject:notif waitUntilDone:NO];
}



//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(postConsoleController:) name:@"NewConsoleControllerObject" object:nil];
//    
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(postConsoleController:) name:@"onRPCResponse" object:nil];
//    
//    
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        self.title = NSLocalizedString(@"Console", @"Console");
//        self.tabBarItem.image = [UIImage imageNamed:@"cog_02"];
//    }
//
//    return self;
//}


- (void)viewDidLoad
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(postConsoleController:) name:@"NewConsoleControllerObject" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(postConsoleController:) name:@"onRPCResponse" object:nil];
    
    consoleController = [[FMConsoleController alloc] initWithTableView:self.consoleView];

    [super viewDidLoad];

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return 5;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"logCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] ;
    }
    
    // Configure the cell...
    NSString *cellContent = @"Prem";//[logArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = cellContent;
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

@end
