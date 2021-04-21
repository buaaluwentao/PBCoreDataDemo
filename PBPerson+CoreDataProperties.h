//
//  PBPerson+CoreDataProperties.h
//  PBCoreDataDemo
//
//  Created by wentao lu on 2021/4/21.
//
//

#import "PBPerson+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface PBPerson (CoreDataProperties)

+ (NSFetchRequest<PBPerson *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nonatomic) int16_t age;

@end

NS_ASSUME_NONNULL_END
