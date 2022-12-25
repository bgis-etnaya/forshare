@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'CDS for Course Table - 00'
define root view entity ZI_Course_00 
as 
select from zcourse_00
association to I_Country as _Country
           on $projection.Country = _Country.Country
association to I_Currency as _Currency
           on $projection.CurrencyCode = _Currency.Currency
composition [0..*] of ZI_SCHEDULE_00 as _Schedule
                   
{
   key course_uuid as CourseUuid,
   course_id       as CourseId,
   course_name     as CourseName,
   country         as Country, 
   price           as Price,
   currency_code   as CurrencyCode,
   blocked         as Blocked,
   @Semantics.systemDateTime.lastChangedAt: true
   last_changed_at as LastChangedAt,
   @Semantics.user.lastChangedBy: true
   last_changed_by as LastChangedBy,
    @Semantics.systemDateTime.lastChangedAt: true
   local_last_changed_at as LocalLastChangedAt,
   //Exposed
   _Schedule,
   _Country,
   _Currency
   //_Schedule
   
}
