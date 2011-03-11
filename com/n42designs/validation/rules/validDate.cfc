<!---
Author: Sean Coyne (coyne.sean@gmail.com)
Name: validDate Rule

$Rev$
$Date$
$Author$
$URL$

Tests that a string is a valid date

--->
<cfcomponent name="validDate" extends="_rule" output="false" hint="I test that a string is a valid date">
	
	<cffunction name="init" access="public" output="false" returntype="any">
		<cfreturn this />
	</cffunction>
	
	<cffunction name="validate" access="public" returntype="boolean" output="false">
		<cfargument name="value" type="string" required="true" />
		<cfreturn isDate(arguments.value) />
	</cffunction>
	
</cfcomponent>