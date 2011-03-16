<cfcomponent name="validNumber" extends="_rule" output="false" hint="I test that a value is a valid number">

	<cffunction name="validate" access="public" returntype="boolean" output="false">
		<cfargument name="value" type="any" required="true" />
		<cfreturn isNumeric(arguments.value) />
	</cffunction>
	
</cfcomponent>