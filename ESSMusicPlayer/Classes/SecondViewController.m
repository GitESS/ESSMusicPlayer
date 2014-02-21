//
//  SecondViewController.m
//  ESSAppLink
//  Log View To Check ALE/TDK Request & Response
//  Created by essadmin on 10/9/13.
//  Copyright (c) 2013 essadmin. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

-(void) logInfo:(NSString*) info {
	[consoleController appendString:info];
}

-(void) logException:(NSException*) ex withMessage:(NSString*) message {
	[consoleController appendString:message];
}

-(void) postConsoleControllerMainThread:(NSNotification *)notif {
    
    [consoleController appendMessage:[notif object]];
    NSString *str = (NSString *)notif;
    
    NSLog(@"-------------------------");
    NSLog(@"Log Value : ----- %@",str);
    NSLog(@"-------------------------");
    
    
}

-(void) postConsoleController:(NSNotification *)notif{
    [self performSelectorOnMainThread:@selector(postConsoleControllerMainThread:) withObject:notif waitUntilDone:NO];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSArray *array = [[NSArray alloc] initWithObjects:@"prem",@"prem",@"prem",@"prem",@"prem",@"prem",@"prem",@"prem",@"prem",@"prem",@"prem", nil];
    logArray = [[NSMutableArray alloc] initWithArray:array];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(postConsoleController:) name:@"NewConsoleControllerObject" object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(postConsoleController:) name:@"onRPCResponse" object:nil];
    
    consoleController = [[FMConsoleController alloc] initWithTableView:self.logTabbleView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
    NSString *cellContent = [logArray objectAtIndex:indexPath.row];
    
    cell.textLabel.text = cellContent;
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}
@end
