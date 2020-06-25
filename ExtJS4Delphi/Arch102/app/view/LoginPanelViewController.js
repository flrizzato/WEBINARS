/*
 * File: app/view/LoginPanelViewController.js
 *
 * This file was generated by Sencha Architect version 4.2.3.
 * http://www.sencha.com/products/architect/
 *
 * This file requires use of the Ext JS 6.5.x Modern library, under independent license.
 * License of Sencha Architect does not include license for Ext JS 6.5.x Modern. For more
 * details see http://www.sencha.com/license or contact license@sencha.com.
 *
 * This file will be auto-generated each and everytime you save your project.
 *
 * Do NOT hand edit this file.
 */

Ext.define('LoginApp.view.LoginPanelViewController', {
    extend: 'Ext.app.ViewController',
    alias: 'controller.loginpanel',

    onSignIn: function(button, e, eOpts) {
        var aform = button.up('container').up('container');
        var ausername = aform.query('#username')[0]._value;
        var apassword = aform.query('#password')[0]._value;
        var ajsondata = '{"username":"'+ausername+'","password":"'+apassword+'"}';

        Ext.Ajax.request({
            url: 'http://localhost:8080/users/login',
            method: 'POST',
            cors: true,
            jsonData: ajsondata,
            success: function (response) {
                Ext.Viewport.remove(Ext.Viewport.getActiveItem(), true);
                Ext.Viewport.animateActiveItem({ xtype: "main-panel" }, { type: "slide", direction: "up" });
            },
            failure: function (response) {
                Ext.Msg.alert('Error', 'Invalid Credentials');
            },
            scope: this
        });


    },

    onForgotPassword: function(button, e, eOpts) {
        Ext.create('LoginApp.view.ForgotPassword', {fullscreen: true});

    },

    onCreateAccount: function(button, e, eOpts) {
        Ext.create('LoginApp.view.CreateAccount', {fullscreen: true});

    }

});