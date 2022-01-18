//
//  ViewController.m
//  HelloWorld
//
//  Created by Akram Elhayani on 16/01/2022.
//

#import "ViewController.h"
#import "SecoundScreenViewController.h"

@interface ViewController ()
{
    double firstNum;
    double secoundNum;
    double resultNum;
    NSString *lastChar;
    NSString *opertator ;
    NSMutableArray<NSString*> *history ;
}
@property (weak, nonatomic) IBOutlet UILabel *lableOpe;
@property (weak, nonatomic) IBOutlet UITextField *Textbox1;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *lable1;
 
@end

@implementation ViewController

 
- (IBAction)clearAC:(id)sender {
    [_Textbox1 setText:@"0"];
    opertator =@"";
    
    [_lable1 setText:@""];
    
}

- (IBAction)buttonClick:(UIButton *)sender {
    if([_Textbox1.text  isEqual: @"0"]){
        [_Textbox1 setText:@""];
    }
    if([lastChar isEqual:@"=" ]==YES){
        [_lable1 setText:@""];
    }
    
    [_Textbox1 setText: [_Textbox1.text  stringByAppendingString:   sender.titleLabel.text]]  ;
    
    [_lable1 setText:[_lable1.text stringByAppendingString:sender.titleLabel.text]];
    lastChar = @"d";
    
}
- (IBAction)dotClicked:(id)sender {
    
    if ([_Textbox1.text containsString:@"."]==NO) {
        if([_Textbox1.text  isEqual: @""]==NO){
            [_Textbox1 setText: [_Textbox1.text  stringByAppendingString:   @"."]]  ;
            
            [_lable1 setText:[_lable1.text stringByAppendingString:@"."]];
            // lastChar = @".";
        }
    }
}

- (IBAction)operatorClicked:(UIButton *)sender  {
    
    if([opertator isEqual:@"="]){
        [_lable1 setText:_Textbox1 .text];
        
        firstNum = [_Textbox1 .text doubleValue];
        
    }else if([opertator isEqual:@""]== NO ){
        resultNum = [self calculate];
        [_Textbox1 setText:[@(resultNum) stringValue]];
        firstNum = resultNum;
        lastChar = @"=";
    }
    else{
        
        firstNum = [_Textbox1 .text doubleValue];
    }
    if([lastChar isEqual:@"o"] == NO)
        [_lable1 setText:[_lable1.text stringByAppendingString:sender.titleLabel.text]];
    
    opertator = sender.titleLabel.text;
    [_Textbox1 setText:@"0"];
    lastChar = @"o";
    
}

- (IBAction)calculateButtonClick:(id)sender {
    
    
    resultNum = [self calculate];
    [_lable1 setText:[_lable1.text stringByAppendingString:@"="]];
    [_lable1 setText:[_lable1.text stringByAppendingString:[@(resultNum) stringValue]]];
    
    
    
    [history addObject:_lable1.text];
    printf("\n%s", [[history objectAtIndex:0] UTF8String] );
    
    
    
    
    [_Textbox1 setText:[@(resultNum) stringValue]];
   
    
    opertator = @"=";
    firstNum = resultNum;
    lastChar = @"=";
    
}
-(double)calculate{
    double _res=0;
    secoundNum = [_Textbox1 .text doubleValue];
    if([opertator isEqual:@"+"])
    {
        _res = firstNum + secoundNum;
    }else if([opertator isEqual:@"−"]){
        _res = firstNum - secoundNum;
    }
    else if([opertator isEqual:@"÷"]){
        _res = firstNum / secoundNum;
    }
    else if([opertator isEqual:@"×"]){
        _res = firstNum * secoundNum;
    }
    return _res;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
       
    }
    return self;
}
-(void)viewDidLoad{
    [super viewDidLoad];
    
    UIBarButtonItem *btn = [[UIBarButtonItem alloc] initWithTitle:@"History"
                                                            style:UIBarButtonItemStylePlain target:self
                                                           action:@selector(editeBtnPressed)];
    [self.navigationItem setRightBarButtonItem:btn];
    [self clearAC:nil];
    history = [NSMutableArray new];
    printf("\n Array initialized ");
    
}

-(void) editeBtnPressed {
    SecoundScreenViewController *viewe = [self.storyboard instantiateViewControllerWithIdentifier:@"historyVC"];
    viewe.text = _lable1.text;
    [ viewe setHistory:history];
    [ viewe setHomeScreenP:self];
 
    [self.navigationController pushViewController:viewe animated:YES];
    
    
}
-(void)clear{
    printf("Clear Clicked ");
}
@end
