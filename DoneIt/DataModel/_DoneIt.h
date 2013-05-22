// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DoneIt.h instead.

#import <CoreData/CoreData.h>


extern const struct DoneItAttributes {
	__unsafe_unretained NSString *content;
	__unsafe_unretained NSString *end;
	__unsafe_unretained NSString *start;
	__unsafe_unretained NSString *timeout;
} DoneItAttributes;

extern const struct DoneItRelationships {
} DoneItRelationships;

extern const struct DoneItFetchedProperties {
} DoneItFetchedProperties;







@interface DoneItID : NSManagedObjectID {}
@end

@interface _DoneIt : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (DoneItID*)objectID;





@property (nonatomic, strong) NSString* content;



//- (BOOL)validateContent:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* end;



//- (BOOL)validateEnd:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* start;



//- (BOOL)validateStart:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* timeout;



@property BOOL timeoutValue;
- (BOOL)timeoutValue;
- (void)setTimeoutValue:(BOOL)value_;

//- (BOOL)validateTimeout:(id*)value_ error:(NSError**)error_;






@end

@interface _DoneIt (CoreDataGeneratedAccessors)

@end

@interface _DoneIt (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveContent;
- (void)setPrimitiveContent:(NSString*)value;




- (NSDate*)primitiveEnd;
- (void)setPrimitiveEnd:(NSDate*)value;




- (NSDate*)primitiveStart;
- (void)setPrimitiveStart:(NSDate*)value;




- (NSNumber*)primitiveTimeout;
- (void)setPrimitiveTimeout:(NSNumber*)value;

- (BOOL)primitiveTimeoutValue;
- (void)setPrimitiveTimeoutValue:(BOOL)value_;




@end
