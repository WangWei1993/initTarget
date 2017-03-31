//
//  CollectionGroup.h
//  PSSAPP
//
//  Created by 王伟 on 2017/3/28.
//  Copyright © 2017年 王伟. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PSSCollectionItem;

@interface PSSCollectionGroup : NSObject

/** headerStr */
@property (nonatomic, copy) NSString *headerStr;


/** items */
//@property (nonatomic, strong) NSArray<CollectionItem *> *items;
@property (nonatomic, strong) NSArray *items;

@end
