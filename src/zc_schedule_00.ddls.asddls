@EndUserText.label: 'Schedule'
@AccessControl.authorizationCheck: #CHECK
 
@Metadata.allowExtensions: true
define view entity ZC_SCHEDULE_00 
as 
projection on ZI_SCHEDULE_00 {
   key ScheduleUuid,
   CourseBegin,
   CourseUuid,
   Location,
   Trainer,
   IsOnline,
   LastChangedAt,
   LastChangedBy,
   LocalLastChangedAt,
   /* Associations */
   _Course: redirected to parent ZC_Course_00
}
