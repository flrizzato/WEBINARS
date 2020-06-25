/*
 * File: app/view/ForgotPassword.js
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

Ext.define('LoginApp.view.ForgotPassword', {
    extend: 'Ext.Panel',
    alias: 'widget.forgotpassword',

    requires: [
        'LoginApp.view.ForgotPasswordViewModel',
        'Ext.Container',
        'Ext.field.Email',
        'Ext.Button'
    ],

    viewModel: {
        type: 'forgotpassword'
    },
    width: 320,
    centered: true,
    modal: true,
    title: 'Forgot password',

    items: [
        {
            xtype: 'container',
            padding: '10 5',
            defaults: {
                margin: 10
            },
            items: [
                {
                    xtype: 'emailfield',
                    name: 'username',
                    scrollable: false,
                    label: 'Enter email',
                    labelWidth: '40%',
                    required: true
                }
            ]
        },
        {
            xtype: 'container',
            layout: {
                type: 'hbox',
                align: 'center',
                pack: 'center'
            },
            items: [
                {
                    xtype: 'button',
                    handler: function(button, e) {
                        this.up('panel').close();
                    },
                    ui: 'decline',
                    width: 160,
                    text: 'Cancel'
                },
                {
                    xtype: 'button',
                    handler: function(button, e) {
                        this.up('panel').close();
                        var passwdResetRequested = Ext.create({
                            xtype: 'panel',
                            fullscreen: true,
                            centered: true,
                            height: 400,
                            width: 400,
                            padding: 10,
                            items: [{
                                style: 'font-size: 20px',
                                html: 'Password Reset Requested'
                            }, {
                                padding: '25 0 25 0',
                                style: 'font-size: 14px',
                                html: 'You requested a password reset for your account. Please follow the instructions sent to your email to reset your password, and proceed to login. If you did not request the password reset, proceed to login with your existing password.'
                            }, {
                                xtype: 'container',
                                layout: {
                                    type: 'hbox',
                                    align: 'center',
                                    pack: 'center'
                                },
                                items: [{
                                    xtype: 'button',
                                    text: 'Back to Login',
                                    width: 200,
                                    cls: [
                                    'x-button-focus',
                                    'x-button-pressed'
                                    ],
                                    handler: function() {
                                        this.up('panel').close();
                                    }
                                }]
                            }]
                        });
                        passwdResetRequested.show();
                    },
                    ui: 'confirm',
                    width: 160,
                    text: 'Reset Password'
                }
            ]
        }
    ]

});