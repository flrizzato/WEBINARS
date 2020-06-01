Ext.define('rsextjs.store.Customer', {
   extend: 'Ext.data.Store',
   
   requires: [
       'rsextjs.model.Customer',
       'Ext.data.proxy.Ajax',
       'Ext.data.reader.Json'
   ],   
   
   alias: 'store.customerstore',
   constructor: function(cfg) {
       var me = this;
       cfg = cfg || {};
       me.callParent([Ext.apply({
           autoLoad: true,
           model: 'rsextjs.model.Customer',
           proxy: {
               type: 'ajax',
               url: 'http://localhost:8080/Customer',
               reader: {
                   type: 'json',
                   rootProperty: ''
               }
           }
       }, cfg)]);
   }
});
