<cfcomponent name="validArray" extends="_rule" output="false" hint="I test that a value is a valid Array">

	<cffunction name="validate" access="public" returntype="boolean" output="false">
		<cfargument name="value" type="any" required="true" />
		<cfreturn isArray(arguments.value) />
	</cffunction>
	
</cfcomponent>