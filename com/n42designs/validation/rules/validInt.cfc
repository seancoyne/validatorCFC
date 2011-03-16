<cfcomponent name="validInt" extends="_rule" output="false" hint="I test that a value is a valid integer">

	<cffunction name="validate" access="public" returntype="boolean" output="false">
		<cfargument name="value" type="any" required="true" />
		<cfreturn isValid('integer',arguments.value) />
	</cffunction>
	
</cfcomponent>