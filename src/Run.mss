function Run() {
  txt = CreateSparseArray(
  	PluginName, 
  	Version,
  	Author,
  	AuthorLink,
  	License,
  	LicenseLink,
  	Description,
  	Copyright
  );

  aboutDialogText = JoinStrings(txt, '\n');
  Sibelius.MessageBox(aboutDialogText);
}  //$end
