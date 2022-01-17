//
//  ViewController.m
//  HelloWorld
//
//  Created by Akram Elhayani on 16/01/2022.
//

#import "ViewController.h"

@interface ViewController ()
{
    double firstNum;
    double secoundNum;
    double resultNum;
    NSString *opertator ;
    NSMutableArray<NSString*> *history ;
}
@property (weak, nonatomic) IBOutlet UILabel *lableOpe;
@property (weak, nonatomic) IBOutlet UITextField *Textbox1;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *lable1;

@end

@implementation ViewController

- (IBAction)clearC:(id)sender {
    [_Textbox1 setText:@"0"];
}
- (IBAction)clearAC:(id)sender {
    [_Textbox1 setText:@"0"];
    opertator =@"";
    
    [_lable1 setText:@""];
    
}

- (IBAction)buttonClick:(UIButton *)sender {
    if([_Textbox1.text  isEqual: @"0"]){
        [_Textbox1 setText:@""];
    }
    
    [_Textbox1 setText: [_Textbox1.text  stringByAppendingString:   sender.titleLabel.text]]  ;
    
    [_lable1 setText:[_lable1.text stringByAppendingString:sender.titleLabel.text]];
    
}
- (IBAction)dotClicked:(id)sender {
    
    if ([_Textbox1.text containsString:@"."]==NO) {
        if([_Textbox1.text  isEqual: @""]==NO){
            [_Textbox1 setText: [_Textbox1.text  stringByAppendingString:   @"."]]  ;
            
            [_lable1 setText:[_lable1.text stringByAppendingString:@"."]];
            
            
        }
    }
}

- (IBAction)operatorClicked:(UIButton *)sender  {
 
    
    if([opertator isEqual:@""]== NO ){
        [  self calculateButtonClick:sender];
    }
    
    [_lable1 setText:[_lable1.text stringByAppendingString:sender.titleLabel.text]];
    
    opertator = sender.titleLabel.text;
    firstNum = [_Textbox1 .text doubleValue];
    [_Textbox1 setText:@"0"];
    
}

- (IBAction)calculateButtonClick:(id)sender {
    
    
    resultNum = [self calculate];
    [_Textbox1 setText:[@(resultNum) stringValue]];
    opertator = @"=";
    firstNum = resultNum;
    
}
-(double)calculate{
    double _res=0;
    secoundNum = [_Textbox1 .text doubleValue];
    if([opertator isEqual:@"+"])
    {
        _res = firstNum + secoundNum;
    }else if([opertator isEqual:@"-"]){
        _res = firstNum - secoundNum;
    }
    else if([opertator isEqual:@"/"]){
        _res = firstNum / secoundNum;
    }
    else if([opertator isEqual:@"X"]){
        _res = firstNum * secoundNum;
    }
    return _res;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        history = [NSMutableArray new];
        opertator =@"";
    }
    return self;
}

@end
