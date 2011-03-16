<cfcomponent name="validStruct" extends="_rule" output="false" hint="I test that a value is a valid Struct">

	<cffunction name="validate" access="public" returntype="boolean" output="false">
		<cfargument name="value" type="any" required="true" />
		<cfreturn isStruct(arguments.value) />
	</cffunction>
	
</cfcomponent>