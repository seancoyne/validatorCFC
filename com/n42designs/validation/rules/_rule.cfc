<!---
Author: Sean Coyne (http://www.n42designs.com/)
Name: Base Rule

This is here for any future usage that may require it

All rules should extend this component.  They can have an init function (call super.init() to future-proof) and a validate function.
The validate function should take one argument (value) and return a boolean

--->
<cfcomponent name="_rule" output="false" implements="_iRule">
	
	<cffunction name="init" output="false" access="public" returntype="_rule">
		<cfreturn this />
	</cffunction>
	
	<cffunction name="validate" output="false" access="public" returntype="boolean">
		<cfargument name="value" type="any" required="true" />
		<cfreturn true />
	</cffunction>
	
</cfcomponent>