clear
clc
dep=input("Enter Monthly Depositing Amt: ");
intr=input("Enter Rate of Interest in % : ");
mon=input("Enter the Time Duration (Months): ");

SI= dep * (mon*(mon+1)/2) * intr/1200;
total= dep*mon + SI;
disp(round(total));
