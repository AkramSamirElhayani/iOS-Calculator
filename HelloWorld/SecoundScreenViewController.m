//
//  SecoundScreenViewController.m
//  HelloWorld
//
//  Created by Akram Elhayani on 16/01/2022.
//

#import "SecoundScreenViewController.h"

@interface SecoundScreenViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lable1;

@end

@implementation SecoundScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _lable1.text    =_text;
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
