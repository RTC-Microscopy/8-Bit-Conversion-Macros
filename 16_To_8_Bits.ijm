/*
 * Converts a 16-bit image into an 8-bit one safely.
 * When converting an image to another bit-setting, ImageJ uses the contrast
 * settings of the image as the 'real' original value range.
 * This may result in an unexpected rescaling of the image when converting to
 * a new bit range.
 * The following macro makes the rescaling from 16-bits to 8-bits retain its
 * original scaling.
 */
macro "Convert 16 to 8 bits linear" 
{ 
	// Get the current 16-bits range settings
	oldRange = call("ij.ImagePlus.getDefault16bitRange");
	// Set the display range of the image to 16 bit values.
	setMinAndMax(0, 65535); 
	// Ensure 16-bit conversion
	call("ij.ImagePlus.setDefault16bitRange", 16);
	// Convert the image
	run("8-bit"); 
	// Restore the old range value
	call("ij.ImagePlus.setDefault16bitRange", oldRange); 
} 