#!/bin/bash
pdftotext -layout result_MDL.pdf result_MDL.txt
pdftotext -layout result2_MDL.pdf result2_MDL.txt

grep -A1 'MDL16CS' result_MDL.txt >tmp1.txt
grep -A1 'MDL16CS' result2_MDL.txt >tmp2.txt 

tr -d '\040\011\012\015\014\054'< tmp1.txt> s1.txt
tr -d '\040\011\012\015\014\054'< tmp2.txt> s2.txt

sed -i 's/MDL16CS/\nMDL16CS/g' s1.txt
sed -i 's/MDL16CS/\nMDL16CS/g' s2.txt
sed -i 's/--/ /g' s1.txt
sed -i 's/--/ /g' s2.txt

sed -i "s/MA101(/ /g" s1.txt
sed -i "s/PH100(/ /g" s1.txt
sed -i "s/BE110(/ /g" s1.txt
sed -i "s/BE10105(/ /g" s1.txt
sed -i "s/EE100(/ /g" s1.txt
sed -i "s/BE103(/ /g" s1.txt
sed -i "s/PH110(/ /g" s1.txt
sed -i "s/EE110(/ /g" s1.txt
sed -i "s/CS110(/ /g" s1.txt
sed -i "s/)/ /g" s1.txt

sed -i "s/O/10/g" s1.txt
sed -i "s/A+/9/g" s1.txt
sed -i "s/A/8.5/g" s1.txt
sed -i "s/B+/8/g" s1.txt
sed -i "s/B/7/g" s1.txt
sed -i "s/ C/6/g" s1.txt
sed -i "s/P/5/g" s1.txt
sed -i "s/F/0/g" s1.txt

sed -i "s/EC100(/ /g" s2.txt
sed -i "s/CY100(/ /g" s2.txt
sed -i "s/BE100(/ /g" s2.txt
sed -i "s/CY110(/ /g" s2.txt
sed -i "s/EC110(/ /g" s2.txt
sed -i "s/MA102(/ /g" s2.txt
sed -i "s/BE102(/ /g" s2.txt
sed -i "s/CS100(/ /g" s2.txt
sed -i "s/CS120(/ /g" s2.txt
sed -i "s/)/ /g" s2.txt

sed -i "s/O/10/g" s2.txt
sed -i "s/A+/9/g" s2.txt
sed -i "s/A/8.5/g" s2.txt
sed -i "s/B+/8/g" s2.txt
sed -i "s/B/7/g" s2.txt
sed -i "s/ C/6/g" s2.txt
sed -i "s/P/5/g" s2.txt
sed -i "s/F/0/g" s2.txt

awk  '{print $1,(($2*4)+($3*4)+($4*3)+($5*3)+($6*3)+($7*3)+($8)+($9)+($10))/23,$11,$12,$13,$14,$15,$16,$17,$18}' s1.txt>GPA1.txt
awk  '{print $1,(($2*4)+($3*4)+($4*3)+($5*3)+($6*3)+($7*3)+($8)+($9)+($10))/23,$11,$12,$13,$14,$15,$16,$17,$18}' s2.txt>GPA2.txt

join -1 1 -2 1 GPA2.txt GPA1.txt >jres1.txt

awk '{print $1,$2,$3,(($2*23)+($3*24))/47}' jres1.txt>CGPA.txt

sort -k 6 csa4blist.txt >sorts1.txt

join -1 1 -2 6 CGPA.txt sorts1.txt>final.txt
cat final.txt
