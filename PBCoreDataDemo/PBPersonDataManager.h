//
//  PBPersonDataManager.h
//  PBCoreDataDemo
//
//  Created by wentao lu on 2021/4/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class PBPerson;
@interface PBPersonDataManager : NSObject
+ (NSArray<NSArray *> *)read;
+ (void)save:(PBPerson *)p;
@end

NS_ASSUME_NONNULL_END
