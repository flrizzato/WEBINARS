The nurse station
==================

It has three mains projects

Resource package( NursestationResourcePackages):
------------------------------------------------
Configuration:
	1.Ems Push: 
		1.1. Add the archive emsserver.ini and credentials for iOS and for android as it shows below:
			[Server.Push.GCM]
			;# This section is for Google Cloud Messaging (GCM) settings.
			;# These settings are needed to send push notificatons to an Android device
			ApiKey=AIzaSyBl2FEVDbRX33RgCr77gXSCk6Ipaa62YYg

			[Server.Push.APNS]
			;# This section is for Apple Push Notification Service (APNS).
			;# These settings are needed to send push notificatons to an IOS device
			CertificateFileName=C:\Developer\Embarcadero\NurseDemo\Final\Certificate\DemoXE8.p12
			;# Name of .p12 or .pem file
			CertificateFilePassword=12345678
			;# Password of certificate file.  Leave blank if file does not have a password.
			ProductionEnvironment=0
			;# Set ProductionEnvironment=1 when the certificate has been created for production.
			;# Set ProductionEnvironment=0 when the certificate has been created for development.
			;# Default value is 0 (development).
	2. Interbase Database
		2.1 make sure that the path where database is correct verify in the unit NurseStationStorageU.pas


Nurse's Application (NurseApp_PatientVitals):
---------------------------------------------
This application is used by nurses and it has the functionality to read the values : 
	1. heart rate 
	2. weight 
	
It's capable to receive notifications by push but in order to do it you first need to verify the following: 
	1. iOS: Apple
		1.1 Create the id for the application in developer.apple.com
		1.2 Assign a push notification support
		1.3 Assign devices where it can be installed 
		1.4 Create provisioning and install it used the Xcode.
	2. Android.
		2.1 Create the project in google developer console 
		2.2 activate Apis,
			2.2.1 Create credentials 
			2.2.2 assign those credentials to emsserver.ini file  ( see EMS Push) 
		2.3 It use bluetooth LE in order to read the values from health devices, which means android respective bluetooth permissions must be activated


Patient's Application (PatientCheckIn2):
----------------------------------------
	This application use two kind of technologies, beacon support and Ems Push. To be able to listen beacon devices it needs to have the bluetooth permissions ON, 
also it applies all considerations of push support both APS and GCM

Steps to verify the correct execution of applications:
	1. Had a beacon available, you can download locale de radius network application from apple store to make your iphone behave as a beacon.
	2. Execute EMS and make sure it’s available  on the local area network ( LAN ) where testing is being done
		2.1 Verify TEMSProvider Component, located on share unit NurseStationClientModuleU.pas and assign the correct value to host property to what you need.
		2.1. Using EMSManagementConsole.exe application located in bin directory of RAD Studio installation 
			2.1.1 Create test user, you must add a new field called Description that must contain user full name.
				  this is the user you’ll use to login on patient application.
	3. Execute nurse's application, you must make sure that the device has been registered on EMS by using EMS Management Console
	4. Execute patient application, as soon as the beacon is detected you will have access to log in, put your user/password created in the additional field called description 
		4.1 When executed you’ll realize the device is also on EMS record 
		4.2 The application will stay on state “waiting” 
	5. If your verify nurse application you will realize that it appears client full name, 
		5.1 If your select then a push to client application will be send by EMS. 
		5.2 Once the push is received the applications change is status then patient's app enabled the second Beacom(Nurse Room)
	6. If patient arrived Nurse Room, (detect 2nd Beacon), send the info to EMS and...
		6.1 EMS send push to Nurse's App and update the label text.
		


