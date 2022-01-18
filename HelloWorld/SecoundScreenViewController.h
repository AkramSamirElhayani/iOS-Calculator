//
//  SecoundScreenViewController.h
//  HelloWorld
//
//  Created by Akram Elhayani on 16/01/2022.
//

#import <UIKit/UIKit.h>
#import "HomeScreenProtocol.h"
NS_ASSUME_NONNULL_BEGIN

@interface SecoundScreenViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>{}
@property   NSString *text ;
@property id <HomeScreenProtocol> homeScreenP;
@property NSMutableArray<NSString*> *history ;
@end

NS_ASSUME_NONNULL_END
