@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Schedule'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
   serviceQuality: #X,
   sizeCategory: #S,
   dataClass: #MIXED
}
define view entity ZI_SCHEDULE_00 
as 
select from zschedule_00
 association to parent ZI_Course_00 as _Course 
             on $projection.CourseUuid = _Course.CourseUuid
{
   
 key schedule_uuid         as ScheduleUuid,
     course_begin          as CourseBegin,
     course_uuid           as CourseUuid,
     location              as Location,
     trainer               as Trainer,
     is_online             as IsOnline,
     @Semantics.systemDateTime.lastChangedAt: true
     last_changed_at       as LastChangedAt,
     @Semantics.user.lastChangedBy: true
     last_changed_by       as LastChangedBy,   
     @Semantics.systemDateTime.lastChangedAt: true
     local_last_changed_at as LocalLastChangedAt,
     //Expose
     _Course
}
