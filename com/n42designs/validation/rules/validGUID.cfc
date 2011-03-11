<!---
Author: Sean Coyne (coyne.sean@gmail.com)
Name: validGUID Rule

$Rev$
$Date$
$Author$
$URL$

Tests that a string is a valid GUID

--->
<cfcomponent name="validGUID" extends="_rule" output="false" hint="I test that a string is a valid GUID">
	
	<cffunction name="init" access="public" output="false" returntype="any">
		<cfreturn this />
	</cffunction>
	
	<cffunction name="validate" access="public" returntype="boolean" output="false">
		<cfargument name="value" type="string" required="true" />
		<cfreturn isValid('GUID',arguments.value) />
	</cffunction>
	
</cfcomponent>