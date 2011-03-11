<!---
Author: Sean Coyne (coyne.sean@gmail.com)
Name: validFloat Rule

$Rev$
$Date$
$Author$
$URL$

Tests that a string is a valid float
--->
<cfcomponent name="validFloat" extends="_rule" output="false" hint="I test that a string is a valid float">
	
	<cffunction name="init" access="public" output="false" returntype="any">
		<cfreturn this />
	</cffunction>
	
	<cffunction name="validate" access="public" returntype="boolean" output="false">
		<cfargument name="value" type="string" required="true" />
		<cfreturn isValid('float',arguments.value) />
	</cffunction>
	
</cfcomponent>