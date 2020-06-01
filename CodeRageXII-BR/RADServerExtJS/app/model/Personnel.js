Ext.define('rsextjs.model.Customer', {
   extend: 'Ext.data.Model',
   
   requires: [
       'Ext.data.field.Field'
   ],
   
   fields: [
       {
           name: 'CONTACT_FIRST'
       },
       {
           name: 'CONTACT_LAST'
       },
       {
           name: 'PHONE_NO'
       },
       {
           name: 'CITY'
       },
       {
           name: 'STATE_PROVINCE'
       },
       {
           name: 'COUNTRY'
       }
   ]
});
