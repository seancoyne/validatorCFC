<cfcomponent name="validImage" extends="_rule" output="false" hint="I test that a value is a valid image">
	
	<cffunction name="validate" access="public" returntype="boolean" output="false">
		<cfargument name="value" type="any" required="true" />
		<cfreturn isImage(arguments.value) />
	</cffunction>
	
</cfcomponent>