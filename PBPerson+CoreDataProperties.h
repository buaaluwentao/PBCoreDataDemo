//
//  PBPerson+CoreDataProperties.h
//  PBCoreDataDemo
//
//  Created by wentao lu on 2021/4/22.
//
//

#import "PBPerson+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface PBPerson (CoreDataProperties)

+ (NSFetchRequest<PBPerson *> *)fetchRequest;

@property (nonatomic) int16_t age;
@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSString *nation;

@end

NS_ASSUME_NONNULL_END
