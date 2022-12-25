@EndUserText.label: 'Projection view'
@AccessControl.authorizationCheck: #CHECK
 
@Search.searchable: true
@Metadata.allowExtensions: true
 
define root view entity ZC_Course_00 
as projection on ZI_Course_00 
{
   key CourseUuid,
   CourseId,
   @Search.defaultSearchElement: true
   CourseName,
   @Consumption.valueHelpDefinition: [{ entity: { name: 'I_Country', element: 'Country' }  }]
   Country,
   //@Semantics.amount.currencyCode: 'CurrencyCode'
   Price,
   @Search.defaultSearchElement: true   
   //@Semantics.currencyCode: true
   @Consumption.valueHelpDefinition: [{ entity: { name: 'I_Currency', element: 'Currency' }  }]    
   CurrencyCode,
   Blocked,
   LastChangedAt,
   LastChangedBy,
   LocalLastChangedAt,
 
   /* Associations */
   _Country,
   _Currency,
   _Schedule: redirected to composition child ZC_SCHEDULE_00
   //_Text
}
