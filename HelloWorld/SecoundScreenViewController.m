//
//  SecoundScreenViewController.m
//  HelloWorld
//
//  Created by Akram Elhayani on 16/01/2022.
//

#import "SecoundScreenViewController.h"

@interface SecoundScreenViewController ()
@property (weak, nonatomic) IBOutlet UITableView *table;
@property (weak, nonatomic) IBOutlet UITableView *dataSource;

@end

@implementation SecoundScreenViewController
{
    

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   
  
    UIBarButtonItem *btn = [[UIBarButtonItem alloc] initWithTitle:@"Clear"
                                                            style:UIBarButtonItemStylePlain target:self
                                                           action:@selector(clearBtnPressed)];
    [self.navigationItem setRightBarButtonItem:btn];
    
   // printf("%s", [[_history objectAtIndex:0] UTF8String] );
    
    
   
   
}
-(void) clearBtnPressed {
    
    [_homeScreenP clear];
    [_history removeAllObjects];
    [self.table reloadData];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_history count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"cell";
 
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
 
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
 
    cell.textLabel.text = [_history objectAtIndex:indexPath.row];
    return cell;
}

@end
