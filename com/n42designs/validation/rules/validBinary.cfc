<!---
Author: Sean Coyne (coyne.sean@gmail.com)
Name: validBinary Rule

$Rev$
$Date$
$Author$
$URL$

Tests that a string is a valid Binary

--->
<cfcomponent name="validBinary" extends="_rule" output="false" hint="I test that a string is a valid Binary">
	
	<cffunction name="init" access="public" output="false" returntype="any">
		<cfreturn this />
	</cffunction>
	
	<cffunction name="validate" access="public" returntype="boolean" output="false">
		<cfargument name="value" type="string" required="true" />
		<cfreturn isValid('Binary',arguments.value) />
	</cffunction>
	
</cfcomponent>