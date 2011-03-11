<!---
Author: Sean Coyne (coyne.sean@gmail.com)
Name: validArray Rule

$Rev$
$Date$
$Author$
$URL$

Tests that a string is a valid Array

--->
<cfcomponent name="validArray" extends="_rule" output="false" hint="I test that a string is a valid Array">
	
	<cffunction name="init" access="public" output="false" returntype="any">
		<cfreturn this />
	</cffunction>
	
	<cffunction name="validate" access="public" returntype="boolean" output="false">
		<cfargument name="value" type="string" required="true" />
		<cfreturn isArray(arguments.value) />
	</cffunction>
	
</cfcomponent>