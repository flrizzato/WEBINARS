/*
 * This file launches the application by asking Ext JS to create
 * and launch() the Application class.
 */
Ext.application({
    extend: 'rsextjs.Application',

    name: 'rsextjs',

    requires: [
        // This will automatically load all classes in the rsextjs namespace
        // so that application classes do not need to require each other.
        'rsextjs.*'
    ],

    // The name of the initial view to create.
    mainView: 'rsextjs.view.main.Main'
});
