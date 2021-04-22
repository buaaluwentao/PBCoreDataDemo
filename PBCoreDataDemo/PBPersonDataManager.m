//
//  PBPersonDataManager.m
//  PBCoreDataDemo
//
//  Created by wentao lu on 2021/4/21.
//

#import "PBPersonDataManager.h"
#import "PBPerson+CoreDataProperties.h"

static NSPersistentContainer *_container;

@interface PBPersonDataManager()
//@property (nonatomic, strong) NSPersistentContainer *container;
@end

@implementation PBPersonDataManager
+ (NSPersistentContainer *)contaier {
    @synchronized (self) {
        if (!_container) {
            _container = [[NSPersistentContainer alloc] initWithName:@"PBCoreDataDemo"];
            [_container loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription * _Nonnull desc, NSError * _Nullable error) {
                if (error) {
                    @throw @"出错了";
                }
            }];
        }
    }
    return _container;
}

+ (NSManagedObjectContext *)viewContext {
    return self.contaier.viewContext;
}

+ (void)save:(PBPerson *)p {
    /*NSEntityDescription *entity = [NSEntityDescription entityForName:@"PBPerson" inManagedObjectContext:self.viewContext];
    NSManagedObject *obj = [[NSManagedObject alloc] initWithEntity:entity insertIntoManagedObjectContext:self.viewContext];
    [obj setValue:p.name forKey:@"name"];
    [obj setValue:@(p.age) forKey:@"age"];
    NSError *error;
    
    [self.viewContext save:&error];
    if (error) {
        @throw @"出错了";
    }*/
    [self.viewContext save:nil];
}

+ (NSArray *)read {
    NSFetchRequest *req = [[NSFetchRequest alloc] initWithEntityName:@"PBPerson"];
    NSError *error;
    return [self.viewContext executeFetchRequest:req error:&error];
}

+ (void)finish {
    if (self.viewContext.hasChanges) {
        NSError *error;
        [self.viewContext save:&error];
    }
}

@end
