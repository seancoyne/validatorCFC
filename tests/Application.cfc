component {
	this.name = "ValidatorCFCTests";
	this.sessionManagement = true;
	this.applicationTimeout = createTimeSpan(0,1,0,0);
	this.sessionTimeout = createTimeSpan(0,0,20,0);
	this.mappings = {
		"/com" = getDirectoryFromPath(getCurrentTemplatePath()) & "../com",
		"/tests" = getDirectoryFromPath(getCurrentTemplatePath()),
		"/mxunit" = getDirectoryFromPath(getCurrentTemplatePath()) & "../../mxunit"
	};
}