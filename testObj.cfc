<!---
Author: Sean Coyne (coyne.sean@gmail.com)

Example object that can be passed to the valiator.cfc validate function.

This can probably (although to be honest, I haven't tested it) be simplified by using form2CFC by Timo Erbach which can be found here http://form2cfc.riaforge.org/

$Rev$
$Date$
$Author$
$URL$

--->




<cfcomponent name="testObj" output="false">
	
	<!--- specify properties, rules, messages and required or not --->
	<cfproperty name="firstName" required="true" type="string" rules="noZeroLengthString" invalidMessage="Please provide your first name" />
	<cfproperty name="lastName" required="true" type="string" rules="noZeroLengthString" invalidMessage="Please provide your last name" />
	<cfproperty name="email" required="true" type="string" rules="noZeroLengthString,validEmail" invalidMessage="Please provide a valid email address" />
	<cfproperty name="dob" required="true" type="string" rules="validDate" invalidMessage="Please provide a valid date of birth" />			
	<cfproperty name="gpa" required="true" type="numeric" rules="validNumber" invalidMessage="Please provide a valid number for GPA" />	

	<cfset variables.firstName = '' />
	<cfset variables.lastName = '' />
	<cfset variables.email = '' />
	<cfset variables.dob = '' />
	<cfset variables.gpa = '' />
	
	<cffunction name="getFirstName" returntype="string" output="false" access="public">
		<cfreturn variables.firstName />
	</cffunction>
	<cffunction name="getLastName" returntype="string" output="false" access="public">
		<cfreturn variables.lastName />
	</cffunction>
	<cffunction name="getEmail" returntype="string" output="false" access="public">
		<cfreturn variables.email />
	</cffunction>
	<cffunction name="getDOB" returntype="string" output="false" access="public">
		<cfreturn variables.dob />
	</cffunction>			
	<cffunction name="getGPA" returntype="numeric" output="false" access="public">
		<cfreturn variables.gpa />
	</cffunction>		
	
	<cffunction name="setFirstName" returntype="void" output="false" access="public">
		<cfargument name="firstName" required="true" type="string" />
		<cfset variables.firstName = arguments.firstName />
	</cffunction>
	<cffunction name="setLastName" returntype="void" output="false" access="public">
		<cfargument name="lastName" required="true" type="string" />
		<cfset variables.lastName = arguments.lastName />
	</cffunction>
	<cffunction name="setEmail" returntype="void" output="false" access="public">
		<cfargument name="email" required="true" type="string" />
		<cfset variables.email = arguments.email />
	</cffunction>
	<cffunction name="setDOB" returntype="void" output="false" access="public">
		<cfargument name="DOB" required="true" type="string" />
		<cfset variables.DOB = arguments.DOB />
	</cffunction>			
	<cffunction name="setGPA" returntype="void" output="false" access="public">
		<cfargument name="gpa" required="true" type="string" />
		<cfset variables.gpa = arguments.gpa />
	</cffunction>	
</cfcomponent>