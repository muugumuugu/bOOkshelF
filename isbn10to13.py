import sys
def isbn10to13(digits):
	if len(digits)==13:
		return digits
	if len(digits)<10 or digits=="0000000000":
		return "0000000000000"
	mltp = 0
	total = 0
	isbn12 = "978"+ digits[0:9]#isbn10[0:9];
	for i in range(12):
		if i%2==0:
			mltp = 1
		else:
			mltp =3
		total = total+(int(isbn12[i])*mltp);
	sumn = (20 - (total % 10)) % 10;
	return isbn12+str(sumn);


print(isbn10to13(sys.argv[1]))