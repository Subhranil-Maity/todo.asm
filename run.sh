clear
echo ""
echo ==================ASSEMBLY==================
fasm main.asm
if [ $? == 0 ];
then
		echo ""
		echo ====================RUN=====================
		./main
		echo ""
		echo ====================END=====================
else
		echo ""
		echo ===================ERROR====================
fi
