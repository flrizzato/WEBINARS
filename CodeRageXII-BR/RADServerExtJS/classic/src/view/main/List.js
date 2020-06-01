/**
 * This view is an example list of people.
 */
Ext.define('rsextjs.view.main.List', {
    extend: 'Ext.grid.Panel',
    xtype: 'mainlist',
	
    requires: [
        'rsextjs.store.Customer'
    ],

    title: 'Customers',
	
	plugins: 'gridfilters',
	features: [{ ftype: 'grouping' }],

    store: {type: 'customerstore'},

    columns: [
        { text: 'First Name',  dataIndex: 'CONTACT_FIRST', filter: {type: 'string'}},
        { text: 'Last Name', dataIndex: 'CONTACT_LAST', flex: 1, filter: {type: 'string'} },
        { text: 'Phone', dataIndex: 'PHONE_NO', flex: 1 },
        { text: 'City', dataIndex: 'CITY', flex: 1, filter: {type: 'string'} },
        { text: 'State', dataIndex: 'STATE_PROVINCE', flex: 1, filter: {type: 'string'} },
        { text: 'Country', dataIndex: 'COUNTRY', flex: 1, filter: {type: 'string'} }
    ],
	
    listeners: {
        select: 'onItemSelected'
    }
});

        