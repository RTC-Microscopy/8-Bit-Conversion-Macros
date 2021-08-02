/*
 * Converts a 12-bit image into an 8-bit one safely.
 * ImageJ does this mostly correctly, but sometimes fails to correctly identify
 * a 16-bits image as really 12-bits. This macro secures that 12-bits is assumed.
 */
macro "Convert 12 to 8 bits linear" 
{ 
	// Get the current 16-bits range settings
	oldRange = call("ij.ImagePlus.getDefault16bitRange");
	// Set the display range of the image to 12 bit values.
	setMinAndMax(0, 4095); 
	// Ensure 12-bit conversion
	call("ij.ImagePlus.setDefault16bitRange", 12);
	// Convert the image
	run("8-bit"); 
	// Restore the old range value
	call("ij.ImagePlus.setDefault16bitRange", oldRange); 
}