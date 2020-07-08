import os
import sys
if len(sys.argv) == 1:
	print("\nUsage python upload.py /Path/To/BitFile.bit\n") 
else :
	filePath = sys.argv[1]
	if(filePath[-4:] != ".bit"):
		print("\nFile to upload must be a .bit file\n")
	else:
		print("\nUploading: " + filePath + "\n")
		command = ("openocd \\\n"
				  "-f digilent-nexys.cfg \\\n"
				  "-f cpld/xilinx-xc7.cfg \\\n"
				  "-c \"adapter_khz 25000\" \\\n"
				  "-c \"init\" \\\n"
				  "-c \"xc7_program xc7.tap\" \\\n"
				  "-c \"pld load 0 %s\" \\\n"
				  "-c \"exit\"" % filePath)
		print(command)
		os.system(command)