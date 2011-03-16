<cfcomponent name="validURL" extends="_rule" output="false" hint="I test that a value is a valid URL">
	
	<cffunction name="validate" access="public" returntype="boolean" output="false">
		<cfargument name="value" type="any" required="true" />
		<cfreturn isValid('URL',arguments.value) />
	</cffunction>
	
</cfcomponent>