<!---
Author: Sean Coyne (coyne.sean@gmail.com)
Name: validEmail Rule

$Rev$
$Date$
$Author$
$URL$

Tests that a string is a valid email address

--->
<cfcomponent name="validEmail" extends="_rule" output="false" hint="I test that a string is a valid email address">
	
	<cffunction name="init" access="public" output="false" returntype="any">
		<cfreturn this />
	</cffunction>
	
	<cffunction name="validate" access="public" returntype="boolean" output="false">
		<cfargument name="value" type="string" required="true" />
		<cfreturn isValid('email',arguments.value) />
	</cffunction>
	
</cfcomponent>