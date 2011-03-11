<!---
Author: Sean Coyne (coyne.sean@gmail.com)
Name: validQuery Rule

$Rev$
$Date$
$Author$
$URL$

Tests that a string is a valid Query

--->
<cfcomponent name="validQuery" extends="_rule" output="false" hint="I test that a string is a valid Query">
	
	<cffunction name="init" access="public" output="false" returntype="any">
		<cfreturn this />
	</cffunction>
	
	<cffunction name="validate" access="public" returntype="boolean" output="false">
		<cfargument name="value" type="string" required="true" />
		<cfreturn isQuery(arguments.value) />
	</cffunction>
	
</cfcomponent>