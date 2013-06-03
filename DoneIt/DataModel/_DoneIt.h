// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DoneIt.h instead.

#import <CoreData/CoreData.h>


extern const struct DoneItAttributes {
	__unsafe_unretained NSString *content;
	__unsafe_unretained NSString *day;
	__unsafe_unretained NSString *end;
	__unsafe_unretained NSString *month;
	__unsafe_unretained NSString *start;
	__unsafe_unretained NSString *timeout;
	__unsafe_unretained NSString *year;
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





@property (nonatomic, strong) NSNumber* day;



@property int16_t dayValue;
- (int16_t)dayValue;
- (void)setDayValue:(int16_t)value_;

//- (BOOL)validateDay:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* end;



//- (BOOL)validateEnd:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* month;



@property int16_t monthValue;
- (int16_t)monthValue;
- (void)setMonthValue:(int16_t)value_;

//- (BOOL)validateMonth:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* start;



//- (BOOL)validateStart:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* timeout;



@property BOOL timeoutValue;
- (BOOL)timeoutValue;
- (void)setTimeoutValue:(BOOL)value_;

//- (BOOL)validateTimeout:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* year;



@property int16_t yearValue;
- (int16_t)yearValue;
- (void)setYearValue:(int16_t)value_;

//- (BOOL)validateYear:(id*)value_ error:(NSError**)error_;






@end

@interface _DoneIt (CoreDataGeneratedAccessors)

@end

@interface _DoneIt (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveContent;
- (void)setPrimitiveContent:(NSString*)value;




- (NSNumber*)primitiveDay;
- (void)setPrimitiveDay:(NSNumber*)value;

- (int16_t)primitiveDayValue;
- (void)setPrimitiveDayValue:(int16_t)value_;




- (NSDate*)primitiveEnd;
- (void)setPrimitiveEnd:(NSDate*)value;




- (NSNumber*)primitiveMonth;
- (void)setPrimitiveMonth:(NSNumber*)value;

- (int16_t)primitiveMonthValue;
- (void)setPrimitiveMonthValue:(int16_t)value_;




- (NSDate*)primitiveStart;
- (void)setPrimitiveStart:(NSDate*)value;




- (NSNumber*)primitiveTimeout;
- (void)setPrimitiveTimeout:(NSNumber*)value;

- (BOOL)primitiveTimeoutValue;
- (void)setPrimitiveTimeoutValue:(BOOL)value_;




- (NSNumber*)primitiveYear;
- (void)setPrimitiveYear:(NSNumber*)value;

- (int16_t)primitiveYearValue;
- (void)setPrimitiveYearValue:(int16_t)value_;




@end
