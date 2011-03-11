<!---
Author: Sean Coyne (coyne.sean@gmail.com)
Name: validSSN Rule

$Rev$
$Date$
$Author$
$URL$

Tests that a string is a valid Social Security Number

--->
<cfcomponent name="validSSN" extends="_rule" output="false" hint="I test that a string is a valid Social Security Number">
	
	<cffunction name="init" access="public" output="false" returntype="any">
		<cfreturn this />
	</cffunction>
	
	<cffunction name="validate" access="public" returntype="boolean" output="false">
		<cfargument name="value" type="string" required="true" />
		<cfreturn isValid('ssn',arguments.value) />
	</cffunction>
	
</cfcomponent>