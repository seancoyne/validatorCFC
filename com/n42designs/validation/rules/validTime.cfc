<!---
Author: Sean Coyne (coyne.sean@gmail.com)
Name: validTime Rule

$Rev$
$Date$
$Author$
$URL$

Tests that a string is a valid Time

--->
<cfcomponent name="validTime" extends="_rule" output="false" hint="I test that a string is a valid Time">
	
	<cffunction name="init" access="public" output="false" returntype="any">
		<cfreturn this />
	</cffunction>
	
	<cffunction name="validate" access="public" returntype="boolean" output="false">
		<cfargument name="value" type="string" required="true" />
		<cfreturn isValid('time',arguments.value) />
	</cffunction>
	
</cfcomponent>