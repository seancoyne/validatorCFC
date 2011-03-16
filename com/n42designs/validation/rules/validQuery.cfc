<cfcomponent name="validQuery" extends="_rule" output="false" hint="I test that a value is a valid Query">

	<cffunction name="validate" access="public" returntype="boolean" output="false">
		<cfargument name="value" type="any" required="true" />
		<cfreturn isQuery(arguments.value) />
	</cffunction>
	
</cfcomponent>