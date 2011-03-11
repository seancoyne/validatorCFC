<!---
Author: Sean Coyne (coyne.sean@gmail.com)
$Rev$
$Date$
$Author$
$URL$
--->

<!--- See comment in validator.cfc for additional usage information --->

<cfset validator = createObject('component','com.n42designs.validation.validator').init() />
<cfset testObj = createObject('component','testObj') />



<!--- try valid test ---->

<cfset testObj.setFirstName('sean') />
<cfset testObj.setLastName('coyne') />
<cfset testObj.setEmail('coyne.sean@gmail.com') />
<cfset testObj.setDOB('12/26/1981') />
<cfset testObj.setGPA('3.89') />

<cfset validator.validate(testObj) />

<cfoutput>
	#validator.getValid()#<br />
</cfoutput>
<cfdump var="#validator.getMessages()#" />




<cfset validator.init() />


<!--- try "fields" test --->
<cfset testObj = createObject('component','testObj') />
<cfset testObj.setFirstName('') />
<cfset testObj.setLastName('Coyne') />
<cfset testObj.setEmail('coyne.sean@gmail.com') />
<cfset testObj.setDOB('') />
<cfset testObj.setGPA('3.89') />
<cfset fields = { firstname=false,lastname=true,email=true,dob=false,gpa=true } />
<cfset validator.validate(testObj,fields) />

<cfoutput>
	#validator.getValid()#<br />
</cfoutput>
<cfdump var="#validator.getMessages()#" />



<cfset validator.init() />

<!--- Try invalid test --->

<cfset testObj.setFirstName('') />
<cfset testObj.setLastName('') />
<cfset testObj.setEmail('') />
<cfset testObj.setDOB('') />
<cfset testObj.setGPA('test') /> 

<cfset validator.validate(testObj) />

<cfoutput>
	#validator.getValid()#<br />
</cfoutput>
<cfdump var="#validator.getMessages()#" />