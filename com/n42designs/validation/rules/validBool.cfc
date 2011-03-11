<!---
Author: Sean Coyne (coyne.sean@gmail.com)
Name: validBool Rule

$Rev$
$Date$
$Author$
$URL$

Tests that a string is a valid Boolean

--->
<cfcomponent name="validBool" extends="_rule" output="false" hint="I test that a string is a valid boolean">
	
	<cffunction name="init" access="public" output="false" returntype="any">
		<cfreturn this />
	</cffunction>
	
	<cffunction name="validate" access="public" returntype="boolean" output="false">
		<cfargument name="value" type="string" required="true" />
		<cfreturn isBoolean(arguments.value) />
	</cffunction>
	
</cfcomponent>