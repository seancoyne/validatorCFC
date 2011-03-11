<!---
Author: Sean Coyne (coyne.sean@gmail.com)
Name: validStruct Rule

$Rev$
$Date$
$Author$
$URL$

Tests that a string is a valid Struct

--->
<cfcomponent name="validStruct" extends="_rule" output="false" hint="I test that a string is a valid Struct">
	
	<cffunction name="init" access="public" output="false" returntype="any">
		<cfreturn this />
	</cffunction>
	
	<cffunction name="validate" access="public" returntype="boolean" output="false">
		<cfargument name="value" type="string" required="true" />
		<cfreturn isStruct(arguments.value) />
	</cffunction>
	
</cfcomponent>