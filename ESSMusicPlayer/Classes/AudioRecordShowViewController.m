//
//  AudioRecordShowViewController.m
//  AppLinkTester2
//
//  Copyright (c) 2013 Ford Motor Company. All rights reserved.
//
//

#import "AudioRecordShowViewController.h"
#import "SyncBrain.h"

@interface AudioRecordShowViewController ()

@end

@implementation AudioRecordShowViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self.title = @"Audio record";
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:255/255.0 green:183/255.0 blue:117/255.0 alpha:1.0];
    [self backButton];
    recordList = [[UITableView alloc] initWithFrame:CGRectMake(0.0,70.0,320.0,360.0) style:UITableViewStylePlain];
    recordList.delegate = self;
    recordList.dataSource = self;
    recordList.backgroundColor = [UIColor clearColor];
    [self.view addSubview:recordList];
    
    
    
    NSArray *folders = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *documentsFolder = [folders objectAtIndex:0];
    
    NSArray *tempFileList = [[[NSFileManager defaultManager] contentsOfDirectoryAtPath:documentsFolder error:nil] pathsMatchingExtensions:[NSArray arrayWithObject:@"wav"]];
    
    recordArray = [[NSMutableArray alloc] initWithArray:tempFileList];
    
    [recordList reloadData];
    
}

- (void)backButton{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button addTarget:self
               action:@selector(backToLockSecrren:)
     forControlEvents:UIControlEventTouchDown];
    [button setTitle:@"Back" forState:UIControlStateNormal];
    button.frame = CGRectMake(10.0, 10.0, 40.0, 40.0);
    [self.view addSubview:button];
}

- (IBAction)backToLockSecrren:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}
//获取文件的大小
- (NSInteger) getFileSize:(NSString*) path
{
    NSFileManager * filemanager = [[NSFileManager alloc]init] ;
    if([filemanager fileExistsAtPath:path]){
        NSDictionary * attributes = [filemanager attributesOfItemAtPath:path error:nil];
        NSNumber *theFileSize;
        if ( (theFileSize = [attributes objectForKey:NSFileSize]) ){
            NSLog(@"result is %d",[theFileSize intValue]);
            return  [theFileSize intValue]/1024;
            
        }else{
            return -1;
        }
    }
    else
    {
        return -1;
    }
}

- (CGFloat) getVideoDuration:(NSURL*) URL
{
    NSDictionary *opts = [NSDictionary dictionaryWithObject:[NSNumber numberWithBool:NO]
                                                     forKey:AVURLAssetPreferPreciseDurationAndTimingKey];
    AVURLAsset *urlAsset = [AVURLAsset URLAssetWithURL:URL options:opts];
    float second = 0;
    second = urlAsset.duration.value/urlAsset.duration.timescale;
    return second;
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [recordArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.textLabel.font = [UIFont systemFontOfSize:15.0f];
    }
    
    NSArray *folders = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *documentsFolde = [folders objectAtIndex:0];
    NSString *voicePath = [recordArray objectAtIndex:indexPath.row];
    NSString *filePath = [documentsFolde stringByAppendingPathComponent:voicePath];
    cell.textLabel.text = [NSString stringWithFormat:@"Size%d KB-%@",(int)[self getFileSize:filePath],voicePath];
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSArray *folders = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *documentsFolde = [folders objectAtIndex:0];
    NSString *filePath = [documentsFolde stringByAppendingPathComponent:[recordArray objectAtIndex:indexPath.row]];
    
    [[SyncBrain sharedInstance] alert:filePath];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        NSError *error = nil;
        AVAudioPlayer * audioPath1 = [[AVAudioPlayer alloc]initWithContentsOfURL:[NSURL fileURLWithPath:filePath] error:&error];
        if (!error) {
            [audioPath1 play];
            [[SyncBrain sharedInstance] alert:@"No Error"];
        }
        else {
            NSLog(@"Error in creating audio player:%@",[error description]);
        }
    }
    else {
        NSLog(@"File doesn't exists");
    }
    
    /*
     _moviePlayerViewController = [[MPMoviePlayerViewController alloc] initWithContentURL:[NSURL fileURLWithPath:filePath]];
     _moviePlayerViewController.view.frame = self.navigationController.view.frame;
     [_moviePlayerViewController.moviePlayer play];
     [self.navigationController.view addSubview:_moviePlayerViewController.view];*/
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(movieFinished:) name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *folders = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *documentsFolde = [folders objectAtIndex:0];
    NSString *filePath = [documentsFolde stringByAppendingPathComponent:[recordArray objectAtIndex:indexPath.row]];
    
    NSError *error;
    NSFileManager *fileMgr = [NSFileManager defaultManager];
    if ([fileMgr removeItemAtPath:filePath error:&error] != YES) {
        NSLog(@"Unable to delete file: %@", [error localizedDescription]);
    } else {
        [recordArray removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath, nil]
                         withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}

- (void)movieFinished:(id)aNotification
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
    
    [_moviePlayerViewController.view removeFromSuperview];
    //[_moviePlayerViewController release];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
