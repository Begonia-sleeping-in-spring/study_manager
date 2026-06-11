#!/bin/bash

echo "正在创建测试文件..."

touch share/test.pdf
touch share/linux.pptx

touch share/demo.c
touch share/run.sh

touch share/report.docx
touch share/note.txt

touch share/data.zip


echo "PDF Test" > share/test.pdf

echo "PPT Test" > share/linux.pptx

echo "int main(){}" > share/demo.c

echo "#!/bin/bash" > share/run.sh

echo "Report" > share/report.docx

echo "Note" > share/note.txt

echo "ZIPDATA" > share/data.zip

echo "测试文件创建完成！"
