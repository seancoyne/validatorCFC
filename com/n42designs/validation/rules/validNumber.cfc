<!---
Author: Sean Coyne (coyne.sean@gmail.com)
Name: validNumber Rule

$Rev$
$Date$
$Author$
$URL$

Tests that a string is a valid number

--->
<cfcomponent name="validNumber" extends="_rule" output="false" hint="I test that a string is a valid number">
	
	<cffunction name="init" access="public" output="false" returntype="any">
		<cfreturn this />
	</cffunction>
	
	<cffunction name="validate" access="public" returntype="boolean" output="false">
		<cfargument name="value" type="string" required="true" />
		<cfreturn isNumeric(arguments.value) />
	</cffunction>
	
</cfcomponent>