<cfcomponent name="noEmptyArray" extends="_rule" output="false" hint="I test that an value is a non-empty array">
	
	<cffunction name="validate" access="public" returntype="boolean" output="false">
		<cfargument name="value" type="any" required="true" />
		<cfreturn isArray(arguments.value) and arrayLen(arguments.value) />
	</cffunction>
	
</cfcomponent>