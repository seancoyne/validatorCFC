<cfcomponent name="validDate" extends="_rule" output="false" hint="I test that a value is a valid date">

	<cffunction name="validate" access="public" returntype="boolean" output="false">
		<cfargument name="value" type="any" required="true" />
		<cfreturn isDate(arguments.value) />
	</cffunction>
	
</cfcomponent>