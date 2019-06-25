//
//  ReceiveListViewController.h
//  CombancSourceLibrary
//
//  Created by Golden on 2019/5/9.
//  Copyright © 2019 王楠. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum ReceiveType{
    SendType    = 0,   //我创建的
    ReceiveListType    //我收到的
}ReceiveType;

@interface ReceiveListViewController : UIViewController

@property (nonatomic, assign) ReceiveType receiveType;

@end

NS_ASSUME_NONNULL_END
