%% PROBLEM 1
%% 
clc; clear all; close all; 
%% OPEN TABLES 
data_table_acc_1_1   = readtable('Accelerometer_1_1.csv');
data_table_gyro_1_1  = readtable('Gyroscope_1_1.csv');
data_table_mag_1_1   = readtable('Magnetometer_1_1.csv');


g = 9.80328;
tru_acc_1  = [0;0;g];
tru_gyro_1 = [0;0;0];
tru_mag_1  = [-19.729; -4.9369; -47.6421];
%% Accelerometers

acc_x_1_1   = data_table_acc_1_1{:,2};
acc_y_1_1   = data_table_acc_1_1{:,3}; 
acc_z_1_1   = data_table_acc_1_1{:,4};

mu_acc_x_1_1	= mean(acc_x_1_1);
sig2_acc_x_1_1	= var(acc_x_1_1);

mu_acc_y_1_1	=  mean(acc_y_1_1);
sig2_acc_y_1_1	= var(acc_y_1_1);

mu_acc_z_1_1	= mean(acc_z_1_1);
sig2_acc_z_1_1	= var(acc_z_1_1);

mu_acc_1_1      = [mu_acc_x_1_1; mu_acc_y_1_1; mu_acc_z_1_1];
bias_acc_1_1    = [mu_acc_x_1_1; mu_acc_y_1_1; mu_acc_z_1_1] - [0;0;g]		;% m/s/s
var_acc_1_1		= diag([sig2_acc_x_1_1 sig2_acc_y_1_1 sig2_acc_z_1_1]);

%% Gryroscopes

gyro_x_1_1 = data_table_gyro_1_1{:, 2};
gyro_y_1_1 = data_table_gyro_1_1{:, 3};
gyro_z_1_1 = data_table_gyro_1_1{:, 4};


mu_gyro_x_1_1	= mean(gyro_x_1_1);
sig2_gyro_x_1_1	= var(gyro_x_1_1);

mu_gyro_y_1_1	= mean(gyro_y_1_1);
sig2_gyro_y_1_1 = var(gyro_y_1_1);

mu_gyro_z_1_1	= mean(gyro_z_1_1);
sig2_gyro_z_1_1	= var(gyro_z_1_1);

mu_gyro_1_1     = [mu_gyro_x_1_1; mu_gyro_y_1_1; mu_gyro_z_1_1];
bias_gyro_1_1	= -[mu_gyro_x_1_1; mu_gyro_y_1_1; mu_gyro_z_1_1]				;% rad/s
var_gyro_1_1	= diag([sig2_gyro_x_1_1 sig2_gyro_y_1_1 sig2_gyro_z_1_1]);


%% Magnetometers

mag_x_1_1 = data_table_mag_1_1{:, 2};
mag_y_1_1 = data_table_mag_1_1{:, 3};
mag_z_1_1 = data_table_mag_1_1{:, 4};

mu_mag_x_1_1	= mean(mag_x_1_1);
sig2_mag_x_1_1	= var(mag_x_1_1);

mu_mag_y_1_1	= mean(mag_y_1_1);
sig2_mag_y_1_1	= var(mag_y_1_1);

mu_mag_z_1_1	= mean(mag_z_1_1);
sig2_mag_z_1_1	= var(mag_z_1_1);


mu_mag_1_1      = [mu_mag_x_1_1;mu_mag_y_1_1;mu_mag_z_1_1];
bias_mag_1_1	= [mu_mag_x_1_1;mu_mag_y_1_1;mu_mag_z_1_1] - [0;19.729;-47.6421]	;% muT
var_mag_1_1		= diag([sig2_mag_x_1_1 sig2_mag_y_1_1 sig2_mag_z_1_1]);

xlswrite('Data.xls',[mu_acc_1_1 tru_acc_1 bias_acc_1_1 var_acc_1_1],'sheet1','E4');
xlswrite('Data.xls',[mu_gyro_1_1 tru_gyro_1 bias_gyro_1_1 var_gyro_1_1],'sheet2','E4');
xlswrite('Data.xls',[mu_mag_1_1 tru_mag_1 bias_mag_1_1 var_mag_1_1],'sheet3','E4');

%% OPEN TABLES 
data_table_acc_1_2   = readtable('Accelerometer_1_2.csv');
data_table_gyro_1_2  = readtable('Gyroscope_1_2.csv');
data_table_mag_1_2   = readtable('Magnetometer_1_2.csv');


g = 9.80328;
tru_acc_1  = [0;0;g];
tru_gyro_1 = [0;0;0];
tru_mag_1  = [-19.729; -4.9369; -47.6421];
%% Accelerometers

acc_x_1_2   = data_table_acc_1_2{:,2};
acc_y_1_2   = data_table_acc_1_2{:,3}; 
acc_z_1_2   = data_table_acc_1_2{:,4};

mu_acc_x_1_2	= mean(acc_x_1_2);
sig2_acc_x_1_2	= var(acc_x_1_2);

mu_acc_y_1_2	=  mean(acc_y_1_2);
sig2_acc_y_1_2	= var(acc_y_1_2);

mu_acc_z_1_2	= mean(acc_z_1_2);
sig2_acc_z_1_2	= var(acc_z_1_2);

mu_acc_1_2      = [mu_acc_x_1_2; mu_acc_y_1_2; mu_acc_z_1_2];
bias_acc_1_2    = [mu_acc_x_1_2; mu_acc_y_1_2; mu_acc_z_1_2] - [0;0;g]		;% m/s/s
var_acc_1_2		= diag([sig2_acc_x_1_2 sig2_acc_y_1_2 sig2_acc_z_1_2]);

%% Gryroscopes

gyro_x_1_2 = data_table_gyro_1_2{:, 2};
gyro_y_1_2 = data_table_gyro_1_2{:, 3};
gyro_z_1_2 = data_table_gyro_1_2{:, 4};


mu_gyro_x_1_2	= mean(gyro_x_1_2);
sig2_gyro_x_1_2	= var(gyro_x_1_2);

mu_gyro_y_1_2	= mean(gyro_y_1_2);
sig2_gyro_y_1_2 = var(gyro_y_1_2);

mu_gyro_z_1_2	= mean(gyro_z_1_2);
sig2_gyro_z_1_2	= var(gyro_z_1_2);

mu_gyro_1_2     = [mu_gyro_x_1_2; mu_gyro_y_1_2; mu_gyro_z_1_2];
bias_gyro_1_2	= -[mu_gyro_x_1_2; mu_gyro_y_1_2; mu_gyro_z_1_2]				;% rad/s
var_gyro_1_2	= diag([sig2_gyro_x_1_2 sig2_gyro_y_1_2 sig2_gyro_z_1_2]);


%% Magnetometers

mag_x_1_2 = data_table_mag_1_2{:, 2};
mag_y_1_2 = data_table_mag_1_2{:, 3};
mag_z_1_2 = data_table_mag_1_2{:, 4};

mu_mag_x_1_2	= mean(mag_x_1_2);
sig2_mag_x_1_2	= var(mag_x_1_2);

mu_mag_y_1_2	= mean(mag_y_1_2);
sig2_mag_y_1_2	= var(mag_y_1_2);

mu_mag_z_1_2	= mean(mag_z_1_2);
sig2_mag_z_1_2	= var(mag_z_1_2);


mu_mag_1_2      = [mu_mag_x_1_2;mu_mag_y_1_2;mu_mag_z_1_2];
bias_mag_1_2	= [mu_mag_x_1_2;mu_mag_y_1_2;mu_mag_z_1_2] - [0;19.729;-47.6421]	;% muT
var_mag_1_2		= diag([sig2_mag_x_1_2 sig2_mag_y_1_2 sig2_mag_z_1_2]);

xlswrite('Data.xls',[mu_acc_1_2 tru_acc_1 bias_acc_1_2 var_acc_1_2],'sheet1','E7');
xlswrite('Data.xls',[mu_gyro_1_2 tru_gyro_1 bias_gyro_1_2 var_gyro_1_2],'sheet2','E7');
xlswrite('Data.xls',[mu_mag_1_2 tru_mag_1 bias_mag_1_2 var_mag_1_2],'sheet3','E7');

%% OPEN TABLES
data_table_acc_1_3   = readtable('Accelerometer_1_3.csv');
data_table_gyro_1_3  = readtable('Gyroscope_1_3.csv');
data_table_mag_1_3   = readtable('Magnetometer_1_3.csv');


g = 9.80328;
tru_acc_1  = [0;0;g];
tru_gyro_1 = [0;0;0];
tru_mag_1  = [-19.729; -4.9369; -47.6421];
%% Accelerometers

acc_x_1_3   = data_table_acc_1_3{:,2};
acc_y_1_3   = data_table_acc_1_3{:,3}; 
acc_z_1_3   = data_table_acc_1_3{:,4};

mu_acc_x_1_3	= mean(acc_x_1_3);
sig2_acc_x_1_3	= var(acc_x_1_3);

mu_acc_y_1_3	=  mean(acc_y_1_3);
sig2_acc_y_1_3	= var(acc_y_1_3);

mu_acc_z_1_3	= mean(acc_z_1_3);
sig2_acc_z_1_3	= var(acc_z_1_3);

mu_acc_1_3      = [mu_acc_x_1_3; mu_acc_y_1_3; mu_acc_z_1_3];
bias_acc_1_3    = [mu_acc_x_1_3; mu_acc_y_1_3; mu_acc_z_1_3] - [0;0;g]		;% m/s/s
var_acc_1_3		= diag([sig2_acc_x_1_3 sig2_acc_y_1_3 sig2_acc_z_1_3]);

%% Gryroscopes

gyro_x_1_3 = data_table_gyro_1_3{:, 2};
gyro_y_1_3 = data_table_gyro_1_3{:, 3};
gyro_z_1_3 = data_table_gyro_1_3{:, 4};


mu_gyro_x_1_3	= mean(gyro_x_1_3);
sig2_gyro_x_1_3	= var(gyro_x_1_3);

mu_gyro_y_1_3	= mean(gyro_y_1_3);
sig2_gyro_y_1_3 = var(gyro_y_1_3);

mu_gyro_z_1_3	= mean(gyro_z_1_3);
sig2_gyro_z_1_3	= var(gyro_z_1_3);

mu_gyro_1_3     = [mu_gyro_x_1_3; mu_gyro_y_1_3; mu_gyro_z_1_3];
bias_gyro_1_3	= -[mu_gyro_x_1_3; mu_gyro_y_1_3; mu_gyro_z_1_3]				;% rad/s
var_gyro_1_3	= diag([sig2_gyro_x_1_3 sig2_gyro_y_1_3 sig2_gyro_z_1_3]);


%% Magnetometers

mag_x_1_3 = data_table_mag_1_3{:, 2};
mag_y_1_3 = data_table_mag_1_3{:, 3};
mag_z_1_3 = data_table_mag_1_3{:, 4};

mu_mag_x_1_3	= mean(mag_x_1_3);
sig2_mag_x_1_3	= var(mag_x_1_3);

mu_mag_y_1_3	= mean(mag_y_1_3);
sig2_mag_y_1_3	= var(mag_y_1_3);

mu_mag_z_1_3	= mean(mag_z_1_3);
sig2_mag_z_1_3	= var(mag_z_1_3);


mu_mag_1_3      = [mu_mag_x_1_3;mu_mag_y_1_3;mu_mag_z_1_3];
bias_mag_1_3	= [mu_mag_x_1_3;mu_mag_y_1_3;mu_mag_z_1_3] - [0;19.729;-47.6421]	;% muT
var_mag_1_3		= diag([sig2_mag_x_1_3 sig2_mag_y_1_3 sig2_mag_z_1_3]);

xlswrite('Data.xls',[mu_acc_1_3 tru_acc_1 bias_acc_1_3 var_acc_1_3],'sheet1','E10');
xlswrite('Data.xls',[mu_gyro_1_3 tru_gyro_1 bias_gyro_1_3 var_gyro_1_3],'sheet2','E10');
xlswrite('Data.xls',[mu_mag_1_3 tru_mag_1 bias_mag_1_3 var_mag_1_3],'sheet3','E10');

%% OPEN TABLES 
data_table_acc_1_4   = readtable('Accelerometer_1_4.csv');
data_table_gyro_1_4  = readtable('Gyroscope_1_4.csv');
data_table_mag_1_4   = readtable('Magnetometer_1_4.csv');


g = 9.80328;
tru_acc_1  = [0;0;g];
tru_gyro_1 = [0;0;0];
tru_mag_1  = [-19.729; -4.9369; -47.6421];
%% Accelerometers

acc_x_1_4   = data_table_acc_1_4{:,2};
acc_y_1_4   = data_table_acc_1_4{:,3}; 
acc_z_1_4   = data_table_acc_1_4{:,4};

mu_acc_x_1_4	= mean(acc_x_1_4);
sig2_acc_x_1_4	= var(acc_x_1_4);

mu_acc_y_1_4	=  mean(acc_y_1_4);
sig2_acc_y_1_4	= var(acc_y_1_4);

mu_acc_z_1_4	= mean(acc_z_1_4);
sig2_acc_z_1_4	= var(acc_z_1_4);

mu_acc_1_4      = [mu_acc_x_1_4; mu_acc_y_1_4; mu_acc_z_1_4];
bias_acc_1_4    = [mu_acc_x_1_4; mu_acc_y_1_4; mu_acc_z_1_4] - [0;0;g]		;% m/s/s
var_acc_1_4		= diag([sig2_acc_x_1_4 sig2_acc_y_1_4 sig2_acc_z_1_4]);

%% Gryroscopes

gyro_x_1_4 = data_table_gyro_1_4{:, 2};
gyro_y_1_4 = data_table_gyro_1_4{:, 3};
gyro_z_1_4 = data_table_gyro_1_4{:, 4};


mu_gyro_x_1_4	= mean(gyro_x_1_4);
sig2_gyro_x_1_4	= var(gyro_x_1_4);

mu_gyro_y_1_4	= mean(gyro_y_1_4);
sig2_gyro_y_1_4 = var(gyro_y_1_4);

mu_gyro_z_1_4	= mean(gyro_z_1_4);
sig2_gyro_z_1_4	= var(gyro_z_1_4);

mu_gyro_1_4     = [mu_gyro_x_1_4; mu_gyro_y_1_4; mu_gyro_z_1_4];
bias_gyro_1_4	= -[mu_gyro_x_1_4; mu_gyro_y_1_4; mu_gyro_z_1_4]				;% rad/s
var_gyro_1_4	= diag([sig2_gyro_x_1_4 sig2_gyro_y_1_4 sig2_gyro_z_1_4]);


%% Magnetometers

mag_x_1_4 = data_table_mag_1_4{:, 2};
mag_y_1_4 = data_table_mag_1_4{:, 3};
mag_z_1_4 = data_table_mag_1_4{:, 4};

mu_mag_x_1_4	= mean(mag_x_1_4);
sig2_mag_x_1_4	= var(mag_x_1_4);

mu_mag_y_1_4	= mean(mag_y_1_4);
sig2_mag_y_1_4	= var(mag_y_1_4);

mu_mag_z_1_4	= mean(mag_z_1_4);
sig2_mag_z_1_4	= var(mag_z_1_4);


mu_mag_1_4      = [mu_mag_x_1_4;mu_mag_y_1_4;mu_mag_z_1_4];
bias_mag_1_4	= [mu_mag_x_1_4;mu_mag_y_1_4;mu_mag_z_1_4] - [0;19.729;-47.6421]	;% muT
var_mag_1_4		= diag([sig2_mag_x_1_4 sig2_mag_y_1_4 sig2_mag_z_1_4]);

xlswrite('Data.xls',[mu_acc_1_4 tru_acc_1 bias_acc_1_4 var_acc_1_4],'sheet1','E13');
xlswrite('Data.xls',[mu_gyro_1_4 tru_gyro_1 bias_gyro_1_4 var_gyro_1_4],'sheet2','E13');
xlswrite('Data.xls',[mu_mag_1_4 tru_mag_1 bias_mag_1_4 var_mag_1_4],'sheet3','E13');

%% OPEN TABLES 
data_table_acc_1_5   = readtable('Accelerometer_1_5.csv');
data_table_gyro_1_5  = readtable('Gyroscope_1_5.csv');
data_table_mag_1_5   = readtable('Magnetometer_1_5.csv');


g = 9.80328;
tru_acc_1  = [0;0;g];
tru_gyro_1 = [0;0;0];
tru_mag_1  = [-19.729; -4.9369; -47.6421];
%% Accelerometers

acc_x_1_5   = data_table_acc_1_5{:,2};
acc_y_1_5   = data_table_acc_1_5{:,3}; 
acc_z_1_5   = data_table_acc_1_5{:,4};

mu_acc_x_1_5	= mean(acc_x_1_5);
sig2_acc_x_1_5	= var(acc_x_1_5);

mu_acc_y_1_5	=  mean(acc_y_1_5);
sig2_acc_y_1_5	= var(acc_y_1_5);

mu_acc_z_1_5	= mean(acc_z_1_5);
sig2_acc_z_1_5	= var(acc_z_1_5);

mu_acc_1_5      = [mu_acc_x_1_5; mu_acc_y_1_5; mu_acc_z_1_5];
bias_acc_1_5    = [mu_acc_x_1_5; mu_acc_y_1_5; mu_acc_z_1_5] - [0;0;g]		;% m/s/s
var_acc_1_5		= diag([sig2_acc_x_1_5 sig2_acc_y_1_5 sig2_acc_z_1_5]);

%% Gryroscopes

gyro_x_1_5 = data_table_gyro_1_5{:, 2};
gyro_y_1_5 = data_table_gyro_1_5{:, 3};
gyro_z_1_5 = data_table_gyro_1_5{:, 4};


mu_gyro_x_1_5	= mean(gyro_x_1_5);
sig2_gyro_x_1_5	= var(gyro_x_1_5);

mu_gyro_y_1_5	= mean(gyro_y_1_5);
sig2_gyro_y_1_5 = var(gyro_y_1_5);

mu_gyro_z_1_5	= mean(gyro_z_1_5);
sig2_gyro_z_1_5	= var(gyro_z_1_5);

mu_gyro_1_5     = [mu_gyro_x_1_5; mu_gyro_y_1_5; mu_gyro_z_1_5];
bias_gyro_1_5	= -[mu_gyro_x_1_5; mu_gyro_y_1_5; mu_gyro_z_1_5]				;% rad/s
var_gyro_1_5	= diag([sig2_gyro_x_1_5 sig2_gyro_y_1_5 sig2_gyro_z_1_5]);


%% Magnetometers

mag_x_1_5 = data_table_mag_1_5{:, 2};
mag_y_1_5 = data_table_mag_1_5{:, 3};
mag_z_1_5 = data_table_mag_1_5{:, 4};

mu_mag_x_1_5	= mean(mag_x_1_5);
sig2_mag_x_1_5	= var(mag_x_1_5);

mu_mag_y_1_5	= mean(mag_y_1_5);
sig2_mag_y_1_5	= var(mag_y_1_5);

mu_mag_z_1_5	= mean(mag_z_1_5);
sig2_mag_z_1_5	= var(mag_z_1_5);


mu_mag_1_5      = [mu_mag_x_1_5;mu_mag_y_1_5;mu_mag_z_1_5];
bias_mag_1_5	= [mu_mag_x_1_5;mu_mag_y_1_5;mu_mag_z_1_5] - [0;19.729;-47.6421]	;% muT
var_mag_1_5		= diag([sig2_mag_x_1_5 sig2_mag_y_1_5 sig2_mag_z_1_5]);

xlswrite('Data.xls',[mu_acc_1_5 tru_acc_1 bias_acc_1_5 var_acc_1_5],'sheet1','E16');
xlswrite('Data.xls',[mu_gyro_1_5 tru_gyro_1 bias_gyro_1_5 var_gyro_1_5],'sheet2','E16');
xlswrite('Data.xls',[mu_mag_1_5 tru_mag_1 bias_mag_1_5 var_mag_1_5],'sheet3','E16');

%% OPEN TABLES 
data_table_acc_2_1   = readtable('Accelerometer_2_1.csv');
data_table_gyro_2_1  = readtable('Gyroscope_2_1.csv');
data_table_mag_2_1   = readtable('Magnetometer_2_1.csv');


g = 9.80328;
tru_acc_2  = [0;g;0];
tru_gyro_2 = [0;0;0];
tru_mag_2  = [-19.729;-47.6421;4.9369];
%% Accelerometers

acc_x_2_1   = data_table_acc_2_1{:,2};
acc_y_2_1   = data_table_acc_2_1{:,3}; 
acc_z_2_1   = data_table_acc_2_1{:,4};

mu_acc_x_2_1	= mean(acc_x_2_1);
sig2_acc_x_2_1	= var(acc_x_2_1);

mu_acc_y_2_1	=  mean(acc_y_2_1);
sig2_acc_y_2_1	= var(acc_y_2_1);

mu_acc_z_2_1	= mean(acc_z_2_1);
sig2_acc_z_2_1	= var(acc_z_2_1);

mu_acc_2_1      = [mu_acc_x_2_1; mu_acc_y_2_1; mu_acc_z_2_1];
bias_acc_2_1    = [mu_acc_x_2_1; mu_acc_y_2_1; mu_acc_z_2_1] - [0;0;g]		;% m/s/s
var_acc_2_1		= diag([sig2_acc_x_2_1 sig2_acc_y_2_1 sig2_acc_z_2_1]);

%% Gryroscopes

gyro_x_2_1 = data_table_gyro_2_1{:, 2};
gyro_y_2_1 = data_table_gyro_2_1{:, 3};
gyro_z_2_1 = data_table_gyro_2_1{:, 4};


mu_gyro_x_2_1	= mean(gyro_x_2_1);
sig2_gyro_x_2_1	= var(gyro_x_2_1);

mu_gyro_y_2_1	= mean(gyro_y_2_1);
sig2_gyro_y_2_1 = var(gyro_y_2_1);

mu_gyro_z_2_1	= mean(gyro_z_2_1);
sig2_gyro_z_2_1	= var(gyro_z_2_1);

mu_gyro_2_1     = [mu_gyro_x_2_1; mu_gyro_y_2_1; mu_gyro_z_2_1];
bias_gyro_2_1	= -[mu_gyro_x_2_1; mu_gyro_y_2_1; mu_gyro_z_2_1]				;% rad/s
var_gyro_2_1	= diag([sig2_gyro_x_2_1 sig2_gyro_y_2_1 sig2_gyro_z_2_1]);


%% Magnetometers

mag_x_2_1 = data_table_mag_2_1{:, 2};
mag_y_2_1 = data_table_mag_2_1{:, 3};
mag_z_2_1 = data_table_mag_2_1{:, 4};

mu_mag_x_2_1	= mean(mag_x_2_1);
sig2_mag_x_2_1	= var(mag_x_2_1);

mu_mag_y_2_1	= mean(mag_y_2_1);
sig2_mag_y_2_1	= var(mag_y_2_1);

mu_mag_z_2_1	= mean(mag_z_2_1);
sig2_mag_z_2_1	= var(mag_z_2_1);


mu_mag_2_1      = [mu_mag_x_2_1;mu_mag_y_2_1;mu_mag_z_2_1];
bias_mag_2_1	= [mu_mag_x_2_1;mu_mag_y_2_1;mu_mag_z_2_1] - [0;19.729;-47.6421]	;% muT
var_mag_2_1		= diag([sig2_mag_x_2_1 sig2_mag_y_2_1 sig2_mag_z_2_1]);

xlswrite('Data.xls',[mu_acc_2_1 tru_acc_2 bias_acc_2_1 var_acc_2_1],'sheet1','E19');
xlswrite('Data.xls',[mu_gyro_2_1 tru_gyro_2 bias_gyro_2_1 var_gyro_2_1],'sheet2','E19');
xlswrite('Data.xls',[mu_mag_2_1 tru_mag_2 bias_mag_2_1 var_mag_2_1],'sheet3','E19');

%% OPEN TABLES 
data_table_acc_2_2   = readtable('Accelerometer_2_2.csv');
data_table_gyro_2_2  = readtable('Gyroscope_2_2.csv');
data_table_mag_2_2   = readtable('Magnetometer_2_2.csv');


g = 9.80328;
tru_acc_2  = [0;g;0];
tru_gyro_2 = [0;0;0];
tru_mag_2  = [-19.729;-47.6421;4.9369];
%% Accelerometers

acc_x_2_2   = data_table_acc_2_2{:,2};
acc_y_2_2   = data_table_acc_2_2{:,3}; 
acc_z_2_2   = data_table_acc_2_2{:,4};

mu_acc_x_2_2	= mean(acc_x_2_2);
sig2_acc_x_2_2	= var(acc_x_2_2);

mu_acc_y_2_2	=  mean(acc_y_2_2);
sig2_acc_y_2_2	= var(acc_y_2_2);

mu_acc_z_2_2	= mean(acc_z_2_2);
sig2_acc_z_2_2	= var(acc_z_2_2);

mu_acc_2_2      = [mu_acc_x_2_2; mu_acc_y_2_2; mu_acc_z_2_2];
bias_acc_2_2    = [mu_acc_x_2_2; mu_acc_y_2_2; mu_acc_z_2_2] - [0;0;g]		;% m/s/s
var_acc_2_2		= diag([sig2_acc_x_2_2 sig2_acc_y_2_2 sig2_acc_z_2_2]);

%% Gryroscopes

gyro_x_2_2 = data_table_gyro_2_2{:, 2};
gyro_y_2_2 = data_table_gyro_2_2{:, 3};
gyro_z_2_2 = data_table_gyro_2_2{:, 4};


mu_gyro_x_2_2	= mean(gyro_x_2_2);
sig2_gyro_x_2_2	= var(gyro_x_2_2);

mu_gyro_y_2_2	= mean(gyro_y_2_2);
sig2_gyro_y_2_2 = var(gyro_y_2_2);

mu_gyro_z_2_2	= mean(gyro_z_2_2);
sig2_gyro_z_2_2	= var(gyro_z_2_2);

mu_gyro_2_2     = [mu_gyro_x_2_2; mu_gyro_y_2_2; mu_gyro_z_2_2];
bias_gyro_2_2	= -[mu_gyro_x_2_2; mu_gyro_y_2_2; mu_gyro_z_2_2]				;% rad/s
var_gyro_2_2	= diag([sig2_gyro_x_2_2 sig2_gyro_y_2_2 sig2_gyro_z_2_2]);


%% Magnetometers

mag_x_2_2 = data_table_mag_2_2{:, 2};
mag_y_2_2 = data_table_mag_2_2{:, 3};
mag_z_2_2 = data_table_mag_2_2{:, 4};

mu_mag_x_2_2	= mean(mag_x_2_2);
sig2_mag_x_2_2	= var(mag_x_2_2);

mu_mag_y_2_2	= mean(mag_y_2_2);
sig2_mag_y_2_2	= var(mag_y_2_2);

mu_mag_z_2_2	= mean(mag_z_2_2);
sig2_mag_z_2_2	= var(mag_z_2_2);


mu_mag_2_2      = [mu_mag_x_2_2;mu_mag_y_2_2;mu_mag_z_2_2];
bias_mag_2_2	= [mu_mag_x_2_2;mu_mag_y_2_2;mu_mag_z_2_2] - [0;19.729;-47.6421]	;% muT
var_mag_2_2		= diag([sig2_mag_x_2_2 sig2_mag_y_2_2 sig2_mag_z_2_2]);

xlswrite('Data.xls',[mu_acc_2_2 tru_acc_2 bias_acc_2_2 var_acc_2_2],'sheet1','E22');
xlswrite('Data.xls',[mu_gyro_2_2 tru_gyro_2 bias_gyro_2_2 var_gyro_2_2],'sheet2','E22');
xlswrite('Data.xls',[mu_mag_2_2 tru_mag_2 bias_mag_2_2 var_mag_2_2],'sheet3','E22');

%% OPEN TABLES 
data_table_acc_2_3   = readtable('Accelerometer_2_3.csv');
data_table_gyro_2_3  = readtable('Gyroscope_2_3.csv');
data_table_mag_2_3   = readtable('Magnetometer_2_3.csv');


g = 9.80328;
tru_acc_2  = [0;g;0];
tru_gyro_2 = [0;0;0];
tru_mag_2  = [-19.729;-47.6421;4.9369];
%% Accelerometers

acc_x_2_3   = data_table_acc_2_3{:,2};
acc_y_2_3   = data_table_acc_2_3{:,3}; 
acc_z_2_3   = data_table_acc_2_3{:,4};

mu_acc_x_2_3	= mean(acc_x_2_3);
sig2_acc_x_2_3	= var(acc_x_2_3);

mu_acc_y_2_3	=  mean(acc_y_2_3);
sig2_acc_y_2_3	= var(acc_y_2_3);

mu_acc_z_2_3	= mean(acc_z_2_3);
sig2_acc_z_2_3	= var(acc_z_2_3);

mu_acc_2_3      = [mu_acc_x_2_3; mu_acc_y_2_3; mu_acc_z_2_3];
bias_acc_2_3    = [mu_acc_x_2_3; mu_acc_y_2_3; mu_acc_z_2_3] - [0;0;g]		;% m/s/s
var_acc_2_3		= diag([sig2_acc_x_2_3 sig2_acc_y_2_3 sig2_acc_z_2_3]);

%% Gryroscopes

gyro_x_2_3 = data_table_gyro_2_3{:, 2};
gyro_y_2_3 = data_table_gyro_2_3{:, 3};
gyro_z_2_3 = data_table_gyro_2_3{:, 4};


mu_gyro_x_2_3	= mean(gyro_x_2_3);
sig2_gyro_x_2_3	= var(gyro_x_2_3);

mu_gyro_y_2_3	= mean(gyro_y_2_3);
sig2_gyro_y_2_3 = var(gyro_y_2_3);

mu_gyro_z_2_3	= mean(gyro_z_2_3);
sig2_gyro_z_2_3	= var(gyro_z_2_3);

mu_gyro_2_3     = [mu_gyro_x_2_3; mu_gyro_y_2_3; mu_gyro_z_2_3];
bias_gyro_2_3	= -[mu_gyro_x_2_3; mu_gyro_y_2_3; mu_gyro_z_2_3]				;% rad/s
var_gyro_2_3	= diag([sig2_gyro_x_2_3 sig2_gyro_y_2_3 sig2_gyro_z_2_3]);


%% Magnetometers

mag_x_2_3 = data_table_mag_2_3{:, 2};
mag_y_2_3 = data_table_mag_2_3{:, 3};
mag_z_2_3 = data_table_mag_2_3{:, 4};

mu_mag_x_2_3	= mean(mag_x_2_3);
sig2_mag_x_2_3	= var(mag_x_2_3);

mu_mag_y_2_3	= mean(mag_y_2_3);
sig2_mag_y_2_3	= var(mag_y_2_3);

mu_mag_z_2_3	= mean(mag_z_2_3);
sig2_mag_z_2_3	= var(mag_z_2_3);


mu_mag_2_3      = [mu_mag_x_2_3;mu_mag_y_2_3;mu_mag_z_2_3];
bias_mag_2_3	= [mu_mag_x_2_3;mu_mag_y_2_3;mu_mag_z_2_3] - [0;19.729;-47.6421]	;% muT
var_mag_2_3		= diag([sig2_mag_x_2_3 sig2_mag_y_2_3 sig2_mag_z_2_3]);

xlswrite('Data.xls',[mu_acc_2_3 tru_acc_2 bias_acc_2_3 var_acc_2_3],'sheet1','E25');
xlswrite('Data.xls',[mu_gyro_2_3 tru_gyro_2 bias_gyro_2_3 var_gyro_2_3],'sheet2','E25');
xlswrite('Data.xls',[mu_mag_2_3 tru_mag_2 bias_mag_2_3 var_mag_2_3],'sheet3','E25');

%% OPEN TABLES 
data_table_acc_2_4   = readtable('Accelerometer_2_4.csv');
data_table_gyro_2_4  = readtable('Gyroscope_2_4.csv');
data_table_mag_2_4   = readtable('Magnetometer_2_4.csv');


g = 9.80328;
tru_acc_2  = [0;g;0];
tru_gyro_2 = [0;0;0];
tru_mag_2  = [-19.729;-47.6421;4.9369];
%% Accelerometers

acc_x_2_4   = data_table_acc_2_4{:,2};
acc_y_2_4   = data_table_acc_2_4{:,3}; 
acc_z_2_4   = data_table_acc_2_4{:,4};

mu_acc_x_2_4	= mean(acc_x_2_4);
sig2_acc_x_2_4	= var(acc_x_2_4);

mu_acc_y_2_4	=  mean(acc_y_2_4);
sig2_acc_y_2_4	= var(acc_y_2_4);

mu_acc_z_2_4	= mean(acc_z_2_4);
sig2_acc_z_2_4	= var(acc_z_2_4);

mu_acc_2_4      = [mu_acc_x_2_4; mu_acc_y_2_4; mu_acc_z_2_4];
bias_acc_2_4    = [mu_acc_x_2_4; mu_acc_y_2_4; mu_acc_z_2_4] - [0;0;g]		;% m/s/s
var_acc_2_4		= diag([sig2_acc_x_2_4 sig2_acc_y_2_4 sig2_acc_z_2_4]);

%% Gryroscopes

gyro_x_2_4 = data_table_gyro_2_4{:, 2};
gyro_y_2_4 = data_table_gyro_2_4{:, 3};
gyro_z_2_4 = data_table_gyro_2_4{:, 4};


mu_gyro_x_2_4	= mean(gyro_x_2_4);
sig2_gyro_x_2_4	= var(gyro_x_2_4);

mu_gyro_y_2_4	= mean(gyro_y_2_4);
sig2_gyro_y_2_4 = var(gyro_y_2_4);

mu_gyro_z_2_4	= mean(gyro_z_2_4);
sig2_gyro_z_2_4	= var(gyro_z_2_4);

mu_gyro_2_4     = [mu_gyro_x_2_4; mu_gyro_y_2_4; mu_gyro_z_2_4];
bias_gyro_2_4	= -[mu_gyro_x_2_4; mu_gyro_y_2_4; mu_gyro_z_2_4]				;% rad/s
var_gyro_2_4	= diag([sig2_gyro_x_2_4 sig2_gyro_y_2_4 sig2_gyro_z_2_4]);


%% Magnetometers

mag_x_2_4 = data_table_mag_2_4{:, 2};
mag_y_2_4 = data_table_mag_2_4{:, 3};
mag_z_2_4 = data_table_mag_2_4{:, 4};

mu_mag_x_2_4	= mean(mag_x_2_4);
sig2_mag_x_2_4	= var(mag_x_2_4);

mu_mag_y_2_4	= mean(mag_y_2_4);
sig2_mag_y_2_4	= var(mag_y_2_4);

mu_mag_z_2_4	= mean(mag_z_2_4);
sig2_mag_z_2_4	= var(mag_z_2_4);


mu_mag_2_4      = [mu_mag_x_2_4;mu_mag_y_2_4;mu_mag_z_2_4];
bias_mag_2_4	= [mu_mag_x_2_4;mu_mag_y_2_4;mu_mag_z_2_4] - [0;19.729;-47.6421]	;% muT
var_mag_2_4		= diag([sig2_mag_x_2_4 sig2_mag_y_2_4 sig2_mag_z_2_4]);

xlswrite('Data.xls',[mu_acc_2_4 tru_acc_2 bias_acc_2_4 var_acc_2_4],'sheet1','E28');
xlswrite('Data.xls',[mu_gyro_2_4 tru_gyro_2 bias_gyro_2_4 var_gyro_2_4],'sheet2','E28');
xlswrite('Data.xls',[mu_mag_2_4 tru_mag_2 bias_mag_2_4 var_mag_2_4],'sheet3','E28');

%% OPEN TABLES 
data_table_acc_2_5   = readtable('Accelerometer_2_5.csv');
data_table_gyro_2_5  = readtable('Gyroscope_2_5.csv');
data_table_mag_2_5   = readtable('Magnetometer_2_5.csv');


g = 9.80328;
tru_acc_2  = [0;g;0];
tru_gyro_2 = [0;0;0];
tru_mag_2  = [-19.729;-47.6421;4.9369];
%% Accelerometers

acc_x_2_5   = data_table_acc_2_5{:,2};
acc_y_2_5   = data_table_acc_2_5{:,3}; 
acc_z_2_5   = data_table_acc_2_5{:,4};

mu_acc_x_2_5	= mean(acc_x_2_5);
sig2_acc_x_2_5	= var(acc_x_2_5);

mu_acc_y_2_5	=  mean(acc_y_2_5);
sig2_acc_y_2_5	= var(acc_y_2_5);

mu_acc_z_2_5	= mean(acc_z_2_5);
sig2_acc_z_2_5	= var(acc_z_2_5);

mu_acc_2_5      = [mu_acc_x_2_5; mu_acc_y_2_5; mu_acc_z_2_5];
bias_acc_2_5    = [mu_acc_x_2_5; mu_acc_y_2_5; mu_acc_z_2_5] - [0;0;g]		;% m/s/s
var_acc_2_5		= diag([sig2_acc_x_2_5 sig2_acc_y_2_5 sig2_acc_z_2_5]);

%% Gryroscopes

gyro_x_2_5 = data_table_gyro_2_5{:, 2};
gyro_y_2_5 = data_table_gyro_2_5{:, 3};
gyro_z_2_5 = data_table_gyro_2_5{:, 4};


mu_gyro_x_2_5	= mean(gyro_x_2_5);
sig2_gyro_x_2_5	= var(gyro_x_2_5);

mu_gyro_y_2_5	= mean(gyro_y_2_5);
sig2_gyro_y_2_5 = var(gyro_y_2_5);

mu_gyro_z_2_5	= mean(gyro_z_2_5);
sig2_gyro_z_2_5	= var(gyro_z_2_5);

mu_gyro_2_5     = [mu_gyro_x_2_5; mu_gyro_y_2_5; mu_gyro_z_2_5];
bias_gyro_2_5	= -[mu_gyro_x_2_5; mu_gyro_y_2_5; mu_gyro_z_2_5]				;% rad/s
var_gyro_2_5	= diag([sig2_gyro_x_2_5 sig2_gyro_y_2_5 sig2_gyro_z_2_5]);


%% Magnetometers

mag_x_2_5 = data_table_mag_2_5{:, 2};
mag_y_2_5 = data_table_mag_2_5{:, 3};
mag_z_2_5 = data_table_mag_2_5{:, 4};

mu_mag_x_2_5	= mean(mag_x_2_5);
sig2_mag_x_2_5	= var(mag_x_2_5);

mu_mag_y_2_5	= mean(mag_y_2_5);
sig2_mag_y_2_5	= var(mag_y_2_5);

mu_mag_z_2_5	= mean(mag_z_2_5);
sig2_mag_z_2_5	= var(mag_z_2_5);


mu_mag_2_5      = [mu_mag_x_2_5;mu_mag_y_2_5;mu_mag_z_2_5];
bias_mag_2_5	= [mu_mag_x_2_5;mu_mag_y_2_5;mu_mag_z_2_5] - [0;19.729;-47.6421]	;% muT
var_mag_2_5		= diag([sig2_mag_x_2_5 sig2_mag_y_2_5 sig2_mag_z_2_5]);

xlswrite('Data.xls',[mu_acc_2_5 tru_acc_2 bias_acc_2_5 var_acc_2_5],'sheet1','E31');
xlswrite('Data.xls',[mu_gyro_2_5 tru_gyro_2 bias_gyro_2_5 var_gyro_2_5],'sheet2','E31');
xlswrite('Data.xls',[mu_mag_2_5 tru_mag_2 bias_mag_2_5 var_mag_2_5],'sheet3','E31');

clc
%% OPEN TABLES 
data_table_acc_3_1   = readtable('Accelerometer_3_1.csv');
data_table_gyro_3_1  = readtable('Gyroscope_3_1.csv');
data_table_mag_3_1   = readtable('Magnetometer_3_1.csv');


g = 9.80328;
tru_acc_3  = [g;0;0];
tru_gyro_3 = [0;0;0];
tru_mag_3  = [-47.6421;19.729;4.9369];
%% Accelerometers

acc_x_3_1   = data_table_acc_3_1{:,2};
acc_y_3_1   = data_table_acc_3_1{:,3}; 
acc_z_3_1   = data_table_acc_3_1{:,4};

mu_acc_x_3_1	= mean(acc_x_3_1);
sig2_acc_x_3_1	= var(acc_x_3_1);

mu_acc_y_3_1	=  mean(acc_y_3_1);
sig2_acc_y_3_1	= var(acc_y_3_1);

mu_acc_z_3_1	= mean(acc_z_3_1);
sig2_acc_z_3_1	= var(acc_z_3_1);

mu_acc_3_1      = [mu_acc_x_3_1; mu_acc_y_3_1; mu_acc_z_3_1];
bias_acc_3_1    = [mu_acc_x_3_1; mu_acc_y_3_1; mu_acc_z_3_1] - [0;0;g]		;% m/s/s
var_acc_3_1		= diag([sig2_acc_x_3_1 sig2_acc_y_3_1 sig2_acc_z_3_1]);

%% Gryroscopes

gyro_x_3_1 = data_table_gyro_3_1{:, 2};
gyro_y_3_1 = data_table_gyro_3_1{:, 3};
gyro_z_3_1 = data_table_gyro_3_1{:, 4};


mu_gyro_x_3_1	= mean(gyro_x_3_1);
sig2_gyro_x_3_1	= var(gyro_x_3_1);

mu_gyro_y_3_1	= mean(gyro_y_3_1);
sig2_gyro_y_3_1 = var(gyro_y_3_1);

mu_gyro_z_3_1	= mean(gyro_z_3_1);
sig2_gyro_z_3_1	= var(gyro_z_3_1);

mu_gyro_3_1     = [mu_gyro_x_3_1; mu_gyro_y_3_1; mu_gyro_z_3_1];
bias_gyro_3_1	= -[mu_gyro_x_3_1; mu_gyro_y_3_1; mu_gyro_z_3_1]				;% rad/s
var_gyro_3_1	= diag([sig2_gyro_x_3_1 sig2_gyro_y_3_1 sig2_gyro_z_3_1]);


%% Magnetometers

mag_x_3_1 = data_table_mag_3_1{:, 2};
mag_y_3_1 = data_table_mag_3_1{:, 3};
mag_z_3_1 = data_table_mag_3_1{:, 4};

mu_mag_x_3_1	= mean(mag_x_3_1);
sig2_mag_x_3_1	= var(mag_x_3_1);

mu_mag_y_3_1	= mean(mag_y_3_1);
sig2_mag_y_3_1	= var(mag_y_3_1);

mu_mag_z_3_1	= mean(mag_z_3_1);
sig2_mag_z_3_1	= var(mag_z_3_1);


mu_mag_3_1      = [mu_mag_x_3_1;mu_mag_y_3_1;mu_mag_z_3_1];
bias_mag_3_1	= [mu_mag_x_3_1;mu_mag_y_3_1;mu_mag_z_3_1] - [0;19.729;-47.6421]	;% muT
var_mag_3_1		= diag([sig2_mag_x_3_1 sig2_mag_y_3_1 sig2_mag_z_3_1]);

xlswrite('Data.xls',[mu_acc_3_1 tru_acc_3 bias_acc_3_1 var_acc_3_1],'sheet1','E34');
xlswrite('Data.xls',[mu_gyro_3_1 tru_gyro_3 bias_gyro_3_1 var_gyro_3_1],'sheet2','E34');
xlswrite('Data.xls',[mu_mag_3_1 tru_mag_3 bias_mag_3_1 var_mag_3_1],'sheet3','E34');

%% OPEN TABLES 
data_table_acc_3_2   = readtable('Accelerometer_3_2.csv');
data_table_gyro_3_2  = readtable('Gyroscope_3_2.csv');
data_table_mag_3_2   = readtable('Magnetometer_3_2.csv');


g = 9.80328;
tru_acc_3  = [g;0;0];
tru_gyro_3 = [0;0;0];
tru_mag_3  = [-47.6421;19.729;4.9369];
%% Accelerometers

acc_x_3_2   = data_table_acc_3_2{:,2};
acc_y_3_2   = data_table_acc_3_2{:,3}; 
acc_z_3_2   = data_table_acc_3_2{:,4};

mu_acc_x_3_2	= mean(acc_x_3_2);
sig2_acc_x_3_2	= var(acc_x_3_2);

mu_acc_y_3_2	=  mean(acc_y_3_2);
sig2_acc_y_3_2	= var(acc_y_3_2);

mu_acc_z_3_2	= mean(acc_z_3_2);
sig2_acc_z_3_2	= var(acc_z_3_2);

mu_acc_3_2      = [mu_acc_x_3_2; mu_acc_y_3_2; mu_acc_z_3_2];
bias_acc_3_2    = [mu_acc_x_3_2; mu_acc_y_3_2; mu_acc_z_3_2] - [0;0;g]		;% m/s/s
var_acc_3_2		= diag([sig2_acc_x_3_2 sig2_acc_y_3_2 sig2_acc_z_3_2]);

%% Gryroscopes

gyro_x_3_2 = data_table_gyro_3_2{:, 2};
gyro_y_3_2 = data_table_gyro_3_2{:, 3};
gyro_z_3_2 = data_table_gyro_3_2{:, 4};


mu_gyro_x_3_2	= mean(gyro_x_3_2);
sig2_gyro_x_3_2	= var(gyro_x_3_2);

mu_gyro_y_3_2	= mean(gyro_y_3_2);
sig2_gyro_y_3_2 = var(gyro_y_3_2);

mu_gyro_z_3_2	= mean(gyro_z_3_2);
sig2_gyro_z_3_2	= var(gyro_z_3_2);

mu_gyro_3_2     = [mu_gyro_x_3_2; mu_gyro_y_3_2; mu_gyro_z_3_2];
bias_gyro_3_2	= -[mu_gyro_x_3_2; mu_gyro_y_3_2; mu_gyro_z_3_2]				;% rad/s
var_gyro_3_2	= diag([sig2_gyro_x_3_2 sig2_gyro_y_3_2 sig2_gyro_z_3_2]);


%% Magnetometers

mag_x_3_2 = data_table_mag_3_2{:, 2};
mag_y_3_2 = data_table_mag_3_2{:, 3};
mag_z_3_2 = data_table_mag_3_2{:, 4};

mu_mag_x_3_2	= mean(mag_x_3_2);
sig2_mag_x_3_2	= var(mag_x_3_2);

mu_mag_y_3_2	= mean(mag_y_3_2);
sig2_mag_y_3_2	= var(mag_y_3_2);

mu_mag_z_3_2	= mean(mag_z_3_2);
sig2_mag_z_3_2	= var(mag_z_3_2);


mu_mag_3_2      = [mu_mag_x_3_2;mu_mag_y_3_2;mu_mag_z_3_2];
bias_mag_3_2	= [mu_mag_x_3_2;mu_mag_y_3_2;mu_mag_z_3_2] - [0;19.729;-47.6421]	;% muT
var_mag_3_2		= diag([sig2_mag_x_3_2 sig2_mag_y_3_2 sig2_mag_z_3_2]);

xlswrite('Data.xls',[mu_acc_3_2 tru_acc_3 bias_acc_3_2 var_acc_3_2],'sheet1','E37');
xlswrite('Data.xls',[mu_gyro_3_2 tru_gyro_3 bias_gyro_3_2 var_gyro_3_2],'sheet2','E37');
xlswrite('Data.xls',[mu_mag_3_2 tru_mag_3 bias_mag_3_2 var_mag_3_2],'sheet3','E37');

%% OPEN TABLES 
data_table_acc_3_3   = readtable('Accelerometer_3_3.csv');
data_table_gyro_3_3  = readtable('Gyroscope_3_3.csv');
data_table_mag_3_3   = readtable('Magnetometer_3_3.csv');


g = 9.80328;
tru_acc_3  = [g;0;0];
tru_gyro_3 = [0;0;0];
tru_mag_3  = [-47.6421;19.729;4.9369];
%% Accelerometers

acc_x_3_3   = data_table_acc_3_3{:,2};
acc_y_3_3   = data_table_acc_3_3{:,3}; 
acc_z_3_3   = data_table_acc_3_3{:,4};

mu_acc_x_3_3	= mean(acc_x_3_3);
sig2_acc_x_3_3	= var(acc_x_3_3);

mu_acc_y_3_3	=  mean(acc_y_3_3);
sig2_acc_y_3_3	= var(acc_y_3_3);

mu_acc_z_3_3	= mean(acc_z_3_3);
sig2_acc_z_3_3	= var(acc_z_3_3);

mu_acc_3_3      = [mu_acc_x_3_3; mu_acc_y_3_3; mu_acc_z_3_3];
bias_acc_3_3    = [mu_acc_x_3_3; mu_acc_y_3_3; mu_acc_z_3_3] - [0;0;g]		;% m/s/s
var_acc_3_3		= diag([sig2_acc_x_3_3 sig2_acc_y_3_3 sig2_acc_z_3_3]);

%% Gryroscopes

gyro_x_3_3 = data_table_gyro_3_3{:, 2};
gyro_y_3_3 = data_table_gyro_3_3{:, 3};
gyro_z_3_3 = data_table_gyro_3_3{:, 4};


mu_gyro_x_3_3	= mean(gyro_x_3_3);
sig2_gyro_x_3_3	= var(gyro_x_3_3);

mu_gyro_y_3_3	= mean(gyro_y_3_3);
sig2_gyro_y_3_3 = var(gyro_y_3_3);

mu_gyro_z_3_3	= mean(gyro_z_3_3);
sig2_gyro_z_3_3	= var(gyro_z_3_3);

mu_gyro_3_3     = [mu_gyro_x_3_3; mu_gyro_y_3_3; mu_gyro_z_3_3];
bias_gyro_3_3	= -[mu_gyro_x_3_3; mu_gyro_y_3_3; mu_gyro_z_3_3]				;% rad/s
var_gyro_3_3	= diag([sig2_gyro_x_3_3 sig2_gyro_y_3_3 sig2_gyro_z_3_3]);


%% Magnetometers

mag_x_3_3 = data_table_mag_3_3{:, 2};
mag_y_3_3 = data_table_mag_3_3{:, 3};
mag_z_3_3 = data_table_mag_3_3{:, 4};

mu_mag_x_3_3	= mean(mag_x_3_3);
sig2_mag_x_3_3	= var(mag_x_3_3);

mu_mag_y_3_3	= mean(mag_y_3_3);
sig2_mag_y_3_3	= var(mag_y_3_3);

mu_mag_z_3_3	= mean(mag_z_3_3);
sig2_mag_z_3_3	= var(mag_z_3_3);


mu_mag_3_3      = [mu_mag_x_3_3;mu_mag_y_3_3;mu_mag_z_3_3];
bias_mag_3_3	= [mu_mag_x_3_3;mu_mag_y_3_3;mu_mag_z_3_3] - [0;19.729;-47.6421]	;% muT
var_mag_3_3		= diag([sig2_mag_x_3_3 sig2_mag_y_3_3 sig2_mag_z_3_3]);

xlswrite('Data.xls',[mu_acc_3_3 tru_acc_3 bias_acc_3_3 var_acc_3_3],'sheet1','E40');
xlswrite('Data.xls',[mu_gyro_3_3 tru_gyro_3 bias_gyro_3_3 var_gyro_3_3],'sheet2','E40');
xlswrite('Data.xls',[mu_mag_3_3 tru_mag_3 bias_mag_3_3 var_mag_3_3],'sheet3','E40');

%% OPEN TABLES 
data_table_acc_3_4   = readtable('Accelerometer_3_4.csv');
data_table_gyro_3_4  = readtable('Gyroscope_3_4.csv');
data_table_mag_3_4   = readtable('Magnetometer_3_4.csv');


g = 9.80328;
tru_acc_3  = [g;0;0];
tru_gyro_3 = [0;0;0];
tru_mag_3  = [-47.6421;19.729;4.9369];
%% Accelerometers

acc_x_3_4   = data_table_acc_3_4{:,2};
acc_y_3_4   = data_table_acc_3_4{:,3}; 
acc_z_3_4   = data_table_acc_3_4{:,4};

mu_acc_x_3_4	= mean(acc_x_3_4);
sig2_acc_x_3_4	= var(acc_x_3_4);

mu_acc_y_3_4	=  mean(acc_y_3_4);
sig2_acc_y_3_4	= var(acc_y_3_4);

mu_acc_z_3_4	= mean(acc_z_3_4);
sig2_acc_z_3_4	= var(acc_z_3_4);

mu_acc_3_4      = [mu_acc_x_3_4; mu_acc_y_3_4; mu_acc_z_3_4];
bias_acc_3_4    = [mu_acc_x_3_4; mu_acc_y_3_4; mu_acc_z_3_4] - [0;0;g]		;% m/s/s
var_acc_3_4		= diag([sig2_acc_x_3_4 sig2_acc_y_3_4 sig2_acc_z_3_4]);

%% Gryroscopes

gyro_x_3_4 = data_table_gyro_3_4{:, 2};
gyro_y_3_4 = data_table_gyro_3_4{:, 3};
gyro_z_3_4 = data_table_gyro_3_4{:, 4};


mu_gyro_x_3_4	= mean(gyro_x_3_4);
sig2_gyro_x_3_4	= var(gyro_x_3_4);

mu_gyro_y_3_4	= mean(gyro_y_3_4);
sig2_gyro_y_3_4 = var(gyro_y_3_4);

mu_gyro_z_3_4	= mean(gyro_z_3_4);
sig2_gyro_z_3_4	= var(gyro_z_3_4);

mu_gyro_3_4     = [mu_gyro_x_3_4; mu_gyro_y_3_4; mu_gyro_z_3_4];
bias_gyro_3_4	= -[mu_gyro_x_3_4; mu_gyro_y_3_4; mu_gyro_z_3_4]				;% rad/s
var_gyro_3_4	= diag([sig2_gyro_x_3_4 sig2_gyro_y_3_4 sig2_gyro_z_3_4]);


%% Magnetometers

mag_x_3_4 = data_table_mag_3_4{:, 2};
mag_y_3_4 = data_table_mag_3_4{:, 3};
mag_z_3_4 = data_table_mag_3_4{:, 4};

mu_mag_x_3_4	= mean(mag_x_3_4);
sig2_mag_x_3_4	= var(mag_x_3_4);

mu_mag_y_3_4	= mean(mag_y_3_4);
sig2_mag_y_3_4	= var(mag_y_3_4);

mu_mag_z_3_4	= mean(mag_z_3_4);
sig2_mag_z_3_4	= var(mag_z_3_4);


mu_mag_3_4      = [mu_mag_x_3_4;mu_mag_y_3_4;mu_mag_z_3_4];
bias_mag_3_4	= [mu_mag_x_3_4;mu_mag_y_3_4;mu_mag_z_3_4] - [0;19.729;-47.6421]	;% muT
var_mag_3_4		= diag([sig2_mag_x_3_4 sig2_mag_y_3_4 sig2_mag_z_3_4]);

xlswrite('Data.xls',[mu_acc_3_4 tru_acc_3 bias_acc_3_4 var_acc_3_4],'sheet1','E43');
xlswrite('Data.xls',[mu_gyro_3_4 tru_gyro_3 bias_gyro_3_4 var_gyro_3_4],'sheet2','E43');
xlswrite('Data.xls',[mu_mag_3_4 tru_mag_3 bias_mag_3_4 var_mag_3_4],'sheet3','E43');

%% OPEN TABLES 
data_table_acc_3_5   = readtable('Accelerometer_3_5.csv');
data_table_gyro_3_5  = readtable('Gyroscope_3_5.csv');
data_table_mag_3_5   = readtable('Magnetometer_3_5.csv');


g = 9.80328;
tru_acc_3  = [g;0;0];
tru_gyro_3 = [0;0;0];
tru_mag_3  = [-47.6421;19.729;4.9369];
%% Accelerometers

acc_x_3_5   = data_table_acc_3_5{:,2};
acc_y_3_5   = data_table_acc_3_5{:,3}; 
acc_z_3_5   = data_table_acc_3_5{:,4};

mu_acc_x_3_5	= mean(acc_x_3_5);
sig2_acc_x_3_5	= var(acc_x_3_5);

mu_acc_y_3_5	=  mean(acc_y_3_5);
sig2_acc_y_3_5	= var(acc_y_3_5);

mu_acc_z_3_5	= mean(acc_z_3_5);
sig2_acc_z_3_5	= var(acc_z_3_5);

mu_acc_3_5      = [mu_acc_x_3_5; mu_acc_y_3_5; mu_acc_z_3_5];
bias_acc_3_5    = [mu_acc_x_3_5; mu_acc_y_3_5; mu_acc_z_3_5] - [0;0;g]		;% m/s/s
var_acc_3_5		= diag([sig2_acc_x_3_5 sig2_acc_y_3_5 sig2_acc_z_3_5]);

%% Gryroscopes

gyro_x_3_5 = data_table_gyro_3_5{:, 2};
gyro_y_3_5 = data_table_gyro_3_5{:, 3};
gyro_z_3_5 = data_table_gyro_3_5{:, 4};


mu_gyro_x_3_5	= mean(gyro_x_3_5);
sig2_gyro_x_3_5	= var(gyro_x_3_5);

mu_gyro_y_3_5	= mean(gyro_y_3_5);
sig2_gyro_y_3_5 = var(gyro_y_3_5);

mu_gyro_z_3_5	= mean(gyro_z_3_5);
sig2_gyro_z_3_5	= var(gyro_z_3_5);

mu_gyro_3_5     = [mu_gyro_x_3_5; mu_gyro_y_3_5; mu_gyro_z_3_5];
bias_gyro_3_5	= -[mu_gyro_x_3_5; mu_gyro_y_3_5; mu_gyro_z_3_5]				;% rad/s
var_gyro_3_5	= diag([sig2_gyro_x_3_5 sig2_gyro_y_3_5 sig2_gyro_z_3_5]);


%% Magnetometers

mag_x_3_5 = data_table_mag_3_5{:, 2};
mag_y_3_5 = data_table_mag_3_5{:, 3};
mag_z_3_5 = data_table_mag_3_5{:, 4};

mu_mag_x_3_5	= mean(mag_x_3_5);
sig2_mag_x_3_5	= var(mag_x_3_5);

mu_mag_y_3_5	= mean(mag_y_3_5);
sig2_mag_y_3_5	= var(mag_y_3_5);

mu_mag_z_3_5	= mean(mag_z_3_5);
sig2_mag_z_3_5	= var(mag_z_3_5);


mu_mag_3_5      = [mu_mag_x_3_5;mu_mag_y_3_5;mu_mag_z_3_5];
bias_mag_3_5	= [mu_mag_x_3_5;mu_mag_y_3_5;mu_mag_z_3_5] - [0;19.729;-47.6421]	;% muT
var_mag_3_5		= diag([sig2_mag_x_3_5 sig2_mag_y_3_5 sig2_mag_z_3_5]);

xlswrite('Data.xls',[mu_acc_3_5 tru_acc_3 bias_acc_3_5 var_acc_3_5],'sheet1','E46');
xlswrite('Data.xls',[mu_gyro_3_5 tru_gyro_3 bias_gyro_3_5 var_gyro_3_5],'sheet2','E46');
xlswrite('Data.xls',[mu_mag_3_5 tru_mag_3 bias_mag_3_5 var_mag_3_5],'sheet3','E46');

%% OPEN TABLES 
data_table_acc_4_1   = readtable('Accelerometer_4_1.csv');
data_table_gyro_4_1  = readtable('Gyroscope_4_1.csv');
data_table_mag_4_1   = readtable('Magnetometer_4_1.csv');


g = 9.80328;
tru_acc_4  = [0;0;g];
tru_gyro_4 = [0;0;0];
tru_mag_4  = [19.729;0;-47.6421];
%% Accelerometers

acc_x_4_1   = data_table_acc_4_1{:,2};
acc_y_4_1   = data_table_acc_4_1{:,3}; 
acc_z_4_1   = data_table_acc_4_1{:,4};

mu_acc_x_4_1	= mean(acc_x_4_1);
sig2_acc_x_4_1	= var(acc_x_4_1);

mu_acc_y_4_1	=  mean(acc_y_4_1);
sig2_acc_y_4_1	= var(acc_y_4_1);

mu_acc_z_4_1	= mean(acc_z_4_1);
sig2_acc_z_4_1	= var(acc_z_4_1);

mu_acc_4_1      = [mu_acc_x_4_1; mu_acc_y_4_1; mu_acc_z_4_1];
bias_acc_4_1    = [mu_acc_x_4_1; mu_acc_y_4_1; mu_acc_z_4_1] - [0;0;g]		;% m/s/s
var_acc_4_1		= diag([sig2_acc_x_4_1 sig2_acc_y_4_1 sig2_acc_z_4_1]);

%% Gryroscopes

gyro_x_4_1 = data_table_gyro_4_1{:, 2};
gyro_y_4_1 = data_table_gyro_4_1{:, 3};
gyro_z_4_1 = data_table_gyro_4_1{:, 4};


mu_gyro_x_4_1	= mean(gyro_x_4_1);
sig2_gyro_x_4_1	= var(gyro_x_4_1);

mu_gyro_y_4_1	= mean(gyro_y_4_1);
sig2_gyro_y_4_1 = var(gyro_y_4_1);

mu_gyro_z_4_1	= mean(gyro_z_4_1);
sig2_gyro_z_4_1	= var(gyro_z_4_1);

mu_gyro_4_1     = [mu_gyro_x_4_1; mu_gyro_y_4_1; mu_gyro_z_4_1];
bias_gyro_4_1	= -[mu_gyro_x_4_1; mu_gyro_y_4_1; mu_gyro_z_4_1]				;% rad/s
var_gyro_4_1	= diag([sig2_gyro_x_4_1 sig2_gyro_y_4_1 sig2_gyro_z_4_1]);


%% Magnetometers

mag_x_4_1 = data_table_mag_4_1{:, 2};
mag_y_4_1 = data_table_mag_4_1{:, 3};
mag_z_4_1 = data_table_mag_4_1{:, 4};

mu_mag_x_4_1	= mean(mag_x_4_1);
sig2_mag_x_4_1	= var(mag_x_4_1);

mu_mag_y_4_1	= mean(mag_y_4_1);
sig2_mag_y_4_1	= var(mag_y_4_1);

mu_mag_z_4_1	= mean(mag_z_4_1);
sig2_mag_z_4_1	= var(mag_z_4_1);


mu_mag_4_1      = [mu_mag_x_4_1;mu_mag_y_4_1;mu_mag_z_4_1];
bias_mag_4_1	= [mu_mag_x_4_1;mu_mag_y_4_1;mu_mag_z_4_1] - [0;19.729;-47.6421]	;% muT
var_mag_4_1		= diag([sig2_mag_x_4_1 sig2_mag_y_4_1 sig2_mag_z_4_1]);

xlswrite('Data.xls',[mu_acc_4_1 tru_acc_4 bias_acc_4_1 var_acc_4_1],'sheet1','E49');
xlswrite('Data.xls',[mu_gyro_4_1 tru_gyro_4 bias_gyro_4_1 var_gyro_4_1],'sheet2','E49');
xlswrite('Data.xls',[mu_mag_4_1 tru_mag_4 bias_mag_4_1 var_mag_4_1],'sheet3','E49');

%% OPEN TABLES 
data_table_acc_4_2   = readtable('Accelerometer_4_2.csv');
data_table_gyro_4_2  = readtable('Gyroscope_4_2.csv');
data_table_mag_4_2   = readtable('Magnetometer_4_2.csv');


g = 9.80328;
tru_acc_4  = [0;0;g];
tru_gyro_4 = [0;0;0];
tru_mag_4  = [19.729;0;-47.6421];
%% Accelerometers

acc_x_4_2   = data_table_acc_4_2{:,2};
acc_y_4_2   = data_table_acc_4_2{:,3}; 
acc_z_4_2   = data_table_acc_4_2{:,4};

mu_acc_x_4_2	= mean(acc_x_4_2);
sig2_acc_x_4_2	= var(acc_x_4_2);

mu_acc_y_4_2	=  mean(acc_y_4_2);
sig2_acc_y_4_2	= var(acc_y_4_2);

mu_acc_z_4_2	= mean(acc_z_4_2);
sig2_acc_z_4_2	= var(acc_z_4_2);

mu_acc_4_2      = [mu_acc_x_4_2; mu_acc_y_4_2; mu_acc_z_4_2];
bias_acc_4_2    = [mu_acc_x_4_2; mu_acc_y_4_2; mu_acc_z_4_2] - [0;0;g]		;% m/s/s
var_acc_4_2		= diag([sig2_acc_x_4_2 sig2_acc_y_4_2 sig2_acc_z_4_2]);

%% Gryroscopes

gyro_x_4_2 = data_table_gyro_4_2{:, 2};
gyro_y_4_2 = data_table_gyro_4_2{:, 3};
gyro_z_4_2 = data_table_gyro_4_2{:, 4};


mu_gyro_x_4_2	= mean(gyro_x_4_2);
sig2_gyro_x_4_2	= var(gyro_x_4_2);

mu_gyro_y_4_2	= mean(gyro_y_4_2);
sig2_gyro_y_4_2 = var(gyro_y_4_2);

mu_gyro_z_4_2	= mean(gyro_z_4_2);
sig2_gyro_z_4_2	= var(gyro_z_4_2);

mu_gyro_4_2     = [mu_gyro_x_4_2; mu_gyro_y_4_2; mu_gyro_z_4_2];
bias_gyro_4_2	= -[mu_gyro_x_4_2; mu_gyro_y_4_2; mu_gyro_z_4_2]				;% rad/s
var_gyro_4_2	= diag([sig2_gyro_x_4_2 sig2_gyro_y_4_2 sig2_gyro_z_4_2]);


%% Magnetometers

mag_x_4_2 = data_table_mag_4_2{:, 2};
mag_y_4_2 = data_table_mag_4_2{:, 3};
mag_z_4_2 = data_table_mag_4_2{:, 4};

mu_mag_x_4_2	= mean(mag_x_4_2);
sig2_mag_x_4_2	= var(mag_x_4_2);

mu_mag_y_4_2	= mean(mag_y_4_2);
sig2_mag_y_4_2	= var(mag_y_4_2);

mu_mag_z_4_2	= mean(mag_z_4_2);
sig2_mag_z_4_2	= var(mag_z_4_2);


mu_mag_4_2      = [mu_mag_x_4_2;mu_mag_y_4_2;mu_mag_z_4_2];
bias_mag_4_2	= [mu_mag_x_4_2;mu_mag_y_4_2;mu_mag_z_4_2] - [0;19.729;-47.6421]	;% muT
var_mag_4_2		= diag([sig2_mag_x_4_2 sig2_mag_y_4_2 sig2_mag_z_4_2]);

xlswrite('Data.xls',[mu_acc_4_2 tru_acc_4 bias_acc_4_2 var_acc_4_2],'sheet1','E52');
xlswrite('Data.xls',[mu_gyro_4_2 tru_gyro_4 bias_gyro_4_2 var_gyro_4_2],'sheet2','E52');
xlswrite('Data.xls',[mu_mag_4_2 tru_mag_4 bias_mag_4_2 var_mag_4_2],'sheet3','E52');

%% OPEN TABLES 
data_table_acc_4_3   = readtable('Accelerometer_4_3.csv');
data_table_gyro_4_3  = readtable('Gyroscope_4_3.csv');
data_table_mag_4_3   = readtable('Magnetometer_4_3.csv');


g = 9.80328;
tru_acc_4  = [0;0;g];
tru_gyro_4 = [0;0;0];
tru_mag_4  = [19.729;0;-47.6421];
%% Accelerometers

acc_x_4_3   = data_table_acc_4_3{:,2};
acc_y_4_3   = data_table_acc_4_3{:,3}; 
acc_z_4_3   = data_table_acc_4_3{:,4};

mu_acc_x_4_3	= mean(acc_x_4_3);
sig2_acc_x_4_3	= var(acc_x_4_3);

mu_acc_y_4_3	=  mean(acc_y_4_3);
sig2_acc_y_4_3	= var(acc_y_4_3);

mu_acc_z_4_3	= mean(acc_z_4_3);
sig2_acc_z_4_3	= var(acc_z_4_3);

mu_acc_4_3      = [mu_acc_x_4_3; mu_acc_y_4_3; mu_acc_z_4_3];
bias_acc_4_3    = [mu_acc_x_4_3; mu_acc_y_4_3; mu_acc_z_4_3] - [0;0;g]		;% m/s/s
var_acc_4_3		= diag([sig2_acc_x_4_3 sig2_acc_y_4_3 sig2_acc_z_4_3]);

%% Gryroscopes

gyro_x_4_3 = data_table_gyro_4_3{:, 2};
gyro_y_4_3 = data_table_gyro_4_3{:, 3};
gyro_z_4_3 = data_table_gyro_4_3{:, 4};


mu_gyro_x_4_3	= mean(gyro_x_4_3);
sig2_gyro_x_4_3	= var(gyro_x_4_3);

mu_gyro_y_4_3	= mean(gyro_y_4_3);
sig2_gyro_y_4_3 = var(gyro_y_4_3);

mu_gyro_z_4_3	= mean(gyro_z_4_3);
sig2_gyro_z_4_3	= var(gyro_z_4_3);

mu_gyro_4_3     = [mu_gyro_x_4_3; mu_gyro_y_4_3; mu_gyro_z_4_3];
bias_gyro_4_3	= -[mu_gyro_x_4_3; mu_gyro_y_4_3; mu_gyro_z_4_3]				;% rad/s
var_gyro_4_3	= diag([sig2_gyro_x_4_3 sig2_gyro_y_4_3 sig2_gyro_z_4_3]);


%% Magnetometers

mag_x_4_3 = data_table_mag_4_3{:, 2};
mag_y_4_3 = data_table_mag_4_3{:, 3};
mag_z_4_3 = data_table_mag_4_3{:, 4};

mu_mag_x_4_3	= mean(mag_x_4_3);
sig2_mag_x_4_3	= var(mag_x_4_3);

mu_mag_y_4_3	= mean(mag_y_4_3);
sig2_mag_y_4_3	= var(mag_y_4_3);

mu_mag_z_4_3	= mean(mag_z_4_3);
sig2_mag_z_4_3	= var(mag_z_4_3);


mu_mag_4_3      = [mu_mag_x_4_3;mu_mag_y_4_3;mu_mag_z_4_3];
bias_mag_4_3	= [mu_mag_x_4_3;mu_mag_y_4_3;mu_mag_z_4_3] - [0;19.729;-47.6421]	;% muT
var_mag_4_3		= diag([sig2_mag_x_4_3 sig2_mag_y_4_3 sig2_mag_z_4_3]);

xlswrite('Data.xls',[mu_acc_4_3 tru_acc_4 bias_acc_4_3 var_acc_4_3],'sheet1','E55');
xlswrite('Data.xls',[mu_gyro_4_3 tru_gyro_4 bias_gyro_4_3 var_gyro_4_3],'sheet2','E55');
xlswrite('Data.xls',[mu_mag_4_3 tru_mag_4 bias_mag_4_3 var_mag_4_3],'sheet3','E55');

%% OPEN TABLES 
data_table_acc_4_4   = readtable('Accelerometer_4_4.csv');
data_table_gyro_4_4  = readtable('Gyroscope_4_4.csv');
data_table_mag_4_4   = readtable('Magnetometer_4_4.csv');


g = 9.80328;
tru_acc_4  = [0;0;g];
tru_gyro_4 = [0;0;0];
tru_mag_4  = [19.729;0;-47.6421];
%% Accelerometers

acc_x_4_4   = data_table_acc_4_4{:,2};
acc_y_4_4   = data_table_acc_4_4{:,3}; 
acc_z_4_4   = data_table_acc_4_4{:,4};

mu_acc_x_4_4	= mean(acc_x_4_4);
sig2_acc_x_4_4	= var(acc_x_4_4);

mu_acc_y_4_4	=  mean(acc_y_4_4);
sig2_acc_y_4_4	= var(acc_y_4_4);

mu_acc_z_4_4	= mean(acc_z_4_4);
sig2_acc_z_4_4	= var(acc_z_4_4);

mu_acc_4_4      = [mu_acc_x_4_4; mu_acc_y_4_4; mu_acc_z_4_4];
bias_acc_4_4    = [mu_acc_x_4_4; mu_acc_y_4_4; mu_acc_z_4_4] - [0;0;g]		;% m/s/s
var_acc_4_4		= diag([sig2_acc_x_4_4 sig2_acc_y_4_4 sig2_acc_z_4_4]);

%% Gryroscopes

gyro_x_4_4 = data_table_gyro_4_4{:, 2};
gyro_y_4_4 = data_table_gyro_4_4{:, 3};
gyro_z_4_4 = data_table_gyro_4_4{:, 4};


mu_gyro_x_4_4	= mean(gyro_x_4_4);
sig2_gyro_x_4_4	= var(gyro_x_4_4);

mu_gyro_y_4_4	= mean(gyro_y_4_4);
sig2_gyro_y_4_4 = var(gyro_y_4_4);

mu_gyro_z_4_4	= mean(gyro_z_4_4);
sig2_gyro_z_4_4	= var(gyro_z_4_4);

mu_gyro_4_4     = [mu_gyro_x_4_4; mu_gyro_y_4_4; mu_gyro_z_4_4];
bias_gyro_4_4	= -[mu_gyro_x_4_4; mu_gyro_y_4_4; mu_gyro_z_4_4]				;% rad/s
var_gyro_4_4	= diag([sig2_gyro_x_4_4 sig2_gyro_y_4_4 sig2_gyro_z_4_4]);


%% Magnetometers

mag_x_4_4 = data_table_mag_4_4{:, 2};
mag_y_4_4 = data_table_mag_4_4{:, 3};
mag_z_4_4 = data_table_mag_4_4{:, 4};

mu_mag_x_4_4	= mean(mag_x_4_4);
sig2_mag_x_4_4	= var(mag_x_4_4);

mu_mag_y_4_4	= mean(mag_y_4_4);
sig2_mag_y_4_4	= var(mag_y_4_4);

mu_mag_z_4_4	= mean(mag_z_4_4);
sig2_mag_z_4_4	= var(mag_z_4_4);


mu_mag_4_4      = [mu_mag_x_4_4;mu_mag_y_4_4;mu_mag_z_4_4];
bias_mag_4_4	= [mu_mag_x_4_4;mu_mag_y_4_4;mu_mag_z_4_4] - [0;19.729;-47.6421]	;% muT
var_mag_4_4		= diag([sig2_mag_x_4_4 sig2_mag_y_4_4 sig2_mag_z_4_4]);

xlswrite('Data.xls',[mu_acc_4_4 tru_acc_4 bias_acc_4_4 var_acc_4_4],'sheet1','E58');
xlswrite('Data.xls',[mu_gyro_4_4 tru_gyro_4 bias_gyro_4_4 var_gyro_4_4],'sheet2','E58');
xlswrite('Data.xls',[mu_mag_4_4 tru_mag_4 bias_mag_4_4 var_mag_4_4],'sheet3','E58');

%% OPEN TABLES 
data_table_acc_4_5   = readtable('Accelerometer_4_5.csv');
data_table_gyro_4_5  = readtable('Gyroscope_4_5.csv');
data_table_mag_4_5   = readtable('Magnetometer_4_5.csv');


g = 9.80328;
tru_acc_4  = [0;0;g];
tru_gyro_4 = [0;0;0];
tru_mag_4  = [19.729;0;-47.6421];
%% Accelerometers

acc_x_4_5   = data_table_acc_4_5{:,2};
acc_y_4_5   = data_table_acc_4_5{:,3}; 
acc_z_4_5   = data_table_acc_4_5{:,4};

mu_acc_x_4_5	= mean(acc_x_4_5);
sig2_acc_x_4_5	= var(acc_x_4_5);

mu_acc_y_4_5	=  mean(acc_y_4_5);
sig2_acc_y_4_5	= var(acc_y_4_5);

mu_acc_z_4_5	= mean(acc_z_4_5);
sig2_acc_z_4_5	= var(acc_z_4_5);

mu_acc_4_5      = [mu_acc_x_4_5; mu_acc_y_4_5; mu_acc_z_4_5];
bias_acc_4_5    = [mu_acc_x_4_5; mu_acc_y_4_5; mu_acc_z_4_5] - [0;0;g]		;% m/s/s
var_acc_4_5		= diag([sig2_acc_x_4_5 sig2_acc_y_4_5 sig2_acc_z_4_5]);

%% Gryroscopes

gyro_x_4_5 = data_table_gyro_4_5{:, 2};
gyro_y_4_5 = data_table_gyro_4_5{:, 3};
gyro_z_4_5 = data_table_gyro_4_5{:, 4};


mu_gyro_x_4_5	= mean(gyro_x_4_5);
sig2_gyro_x_4_5	= var(gyro_x_4_5);

mu_gyro_y_4_5	= mean(gyro_y_4_5);
sig2_gyro_y_4_5 = var(gyro_y_4_5);

mu_gyro_z_4_5	= mean(gyro_z_4_5);
sig2_gyro_z_4_5	= var(gyro_z_4_5);

mu_gyro_4_5     = [mu_gyro_x_4_5; mu_gyro_y_4_5; mu_gyro_z_4_5];
bias_gyro_4_5	= -[mu_gyro_x_4_5; mu_gyro_y_4_5; mu_gyro_z_4_5]				;% rad/s
var_gyro_4_5	= diag([sig2_gyro_x_4_5 sig2_gyro_y_4_5 sig2_gyro_z_4_5]);


%% Magnetometers

mag_x_4_5 = data_table_mag_4_5{:, 2};
mag_y_4_5 = data_table_mag_4_5{:, 3};
mag_z_4_5 = data_table_mag_4_5{:, 4};

mu_mag_x_4_5	= mean(mag_x_4_5);
sig2_mag_x_4_5	= var(mag_x_4_5);

mu_mag_y_4_5	= mean(mag_y_4_5);
sig2_mag_y_4_5	= var(mag_y_4_5);

mu_mag_z_4_5	= mean(mag_z_4_5);
sig2_mag_z_4_5	= var(mag_z_4_5);


mu_mag_4_5      = [mu_mag_x_4_5;mu_mag_y_4_5;mu_mag_z_4_5];
bias_mag_4_5	= [mu_mag_x_4_5;mu_mag_y_4_5;mu_mag_z_4_5] - [0;19.729;-47.6421]	;% muT
var_mag_4_5		= diag([sig2_mag_x_4_5 sig2_mag_y_4_5 sig2_mag_z_4_5]);

xlswrite('Data.xls',[mu_acc_4_5 tru_acc_4 bias_acc_4_5 var_acc_4_5],'sheet1','E61');
xlswrite('Data.xls',[mu_gyro_4_5 tru_gyro_4 bias_gyro_4_5 var_gyro_4_5],'sheet2','E61');
xlswrite('Data.xls',[mu_mag_4_5 tru_mag_4 bias_mag_4_5 var_mag_4_5],'sheet3','E61');

%% OPEN TABLES 
data_table_acc_5_1   = readtable('Accelerometer_5_1.csv');
data_table_gyro_5_1  = readtable('Gyroscope_5_1.csv');
data_table_mag_5_1   = readtable('Magnetometer_5_1.csv');


g = 9.80328;
tru_acc_5  = [0;0;g];
tru_gyro_5 = [0;0;0];
tru_mag_5  = [0;19.729;-47.6421];
%% Accelerometers

acc_x_5_1   = data_table_acc_5_1{:,2};
acc_y_5_1   = data_table_acc_5_1{:,3}; 
acc_z_5_1   = data_table_acc_5_1{:,4};

mu_acc_x_5_1	= mean(acc_x_5_1);
sig2_acc_x_5_1	= var(acc_x_5_1);

mu_acc_y_5_1	=  mean(acc_y_5_1);
sig2_acc_y_5_1	= var(acc_y_5_1);

mu_acc_z_5_1	= mean(acc_z_5_1);
sig2_acc_z_5_1	= var(acc_z_5_1);

mu_acc_5_1      = [mu_acc_x_5_1; mu_acc_y_5_1; mu_acc_z_5_1];
bias_acc_5_1    = [mu_acc_x_5_1; mu_acc_y_5_1; mu_acc_z_5_1] - [0;0;g]		;% m/s/s
var_acc_5_1		= diag([sig2_acc_x_5_1 sig2_acc_y_5_1 sig2_acc_z_5_1]);

%% Gryroscopes

gyro_x_5_1 = data_table_gyro_5_1{:, 2};
gyro_y_5_1 = data_table_gyro_5_1{:, 3};
gyro_z_5_1 = data_table_gyro_5_1{:, 4};


mu_gyro_x_5_1	= mean(gyro_x_5_1);
sig2_gyro_x_5_1	= var(gyro_x_5_1);

mu_gyro_y_5_1	= mean(gyro_y_5_1);
sig2_gyro_y_5_1 = var(gyro_y_5_1);

mu_gyro_z_5_1	= mean(gyro_z_5_1);
sig2_gyro_z_5_1	= var(gyro_z_5_1);

mu_gyro_5_1     = [mu_gyro_x_5_1; mu_gyro_y_5_1; mu_gyro_z_5_1];
bias_gyro_5_1	= -[mu_gyro_x_5_1; mu_gyro_y_5_1; mu_gyro_z_5_1]				;% rad/s
var_gyro_5_1	= diag([sig2_gyro_x_5_1 sig2_gyro_y_5_1 sig2_gyro_z_5_1]);


%% Magnetometers

mag_x_5_1 = data_table_mag_5_1{:, 2};
mag_y_5_1 = data_table_mag_5_1{:, 3};
mag_z_5_1 = data_table_mag_5_1{:, 4};

mu_mag_x_5_1	= mean(mag_x_5_1);
sig2_mag_x_5_1	= var(mag_x_5_1);

mu_mag_y_5_1	= mean(mag_y_5_1);
sig2_mag_y_5_1	= var(mag_y_5_1);

mu_mag_z_5_1	= mean(mag_z_5_1);
sig2_mag_z_5_1	= var(mag_z_5_1);


mu_mag_5_1      = [mu_mag_x_5_1;mu_mag_y_5_1;mu_mag_z_5_1];
bias_mag_5_1	= [mu_mag_x_5_1;mu_mag_y_5_1;mu_mag_z_5_1] - [0;19.729;-47.6421]	;% muT
var_mag_5_1		= diag([sig2_mag_x_5_1 sig2_mag_y_5_1 sig2_mag_z_5_1]);

xlswrite('Data.xls',[mu_acc_5_1 tru_acc_5 bias_acc_5_1 var_acc_5_1],'sheet1','E64');
xlswrite('Data.xls',[mu_gyro_5_1 tru_gyro_5 bias_gyro_5_1 var_gyro_5_1],'sheet2','E64');
xlswrite('Data.xls',[mu_mag_5_1 tru_mag_5 bias_mag_5_1 var_mag_5_1],'sheet3','E64');


%% OPEN TABLES 
data_table_acc_5_2   = readtable('Accelerometer_5_2.csv');
data_table_gyro_5_2  = readtable('Gyroscope_5_2.csv');
data_table_mag_5_2   = readtable('Magnetometer_5_2.csv');


g = 9.80328;
tru_acc_5  = [0;0;g];
tru_gyro_5 = [0;0;0];
tru_mag_5  = [0;19.729;-47.6421];
%% Accelerometers

acc_x_5_2   = data_table_acc_5_2{:,2};
acc_y_5_2   = data_table_acc_5_2{:,3}; 
acc_z_5_2   = data_table_acc_5_2{:,4};

mu_acc_x_5_2	= mean(acc_x_5_2);
sig2_acc_x_5_2	= var(acc_x_5_2);

mu_acc_y_5_2	=  mean(acc_y_5_2);
sig2_acc_y_5_2	= var(acc_y_5_2);

mu_acc_z_5_2	= mean(acc_z_5_2);
sig2_acc_z_5_2	= var(acc_z_5_2);

mu_acc_5_2      = [mu_acc_x_5_2; mu_acc_y_5_2; mu_acc_z_5_2];
bias_acc_5_2    = [mu_acc_x_5_2; mu_acc_y_5_2; mu_acc_z_5_2] - [0;0;g]		;% m/s/s
var_acc_5_2		= diag([sig2_acc_x_5_2 sig2_acc_y_5_2 sig2_acc_z_5_2]);

%% Gryroscopes

gyro_x_5_2 = data_table_gyro_5_2{:, 2};
gyro_y_5_2 = data_table_gyro_5_2{:, 3};
gyro_z_5_2 = data_table_gyro_5_2{:, 4};


mu_gyro_x_5_2	= mean(gyro_x_5_2);
sig2_gyro_x_5_2	= var(gyro_x_5_2);

mu_gyro_y_5_2	= mean(gyro_y_5_2);
sig2_gyro_y_5_2 = var(gyro_y_5_2);

mu_gyro_z_5_2	= mean(gyro_z_5_2);
sig2_gyro_z_5_2	= var(gyro_z_5_2);

mu_gyro_5_2     = [mu_gyro_x_5_2; mu_gyro_y_5_2; mu_gyro_z_5_2];
bias_gyro_5_2	= -[mu_gyro_x_5_2; mu_gyro_y_5_2; mu_gyro_z_5_2]				;% rad/s
var_gyro_5_2	= diag([sig2_gyro_x_5_2 sig2_gyro_y_5_2 sig2_gyro_z_5_2]);


%% Magnetometers

mag_x_5_2 = data_table_mag_5_2{:, 2};
mag_y_5_2 = data_table_mag_5_2{:, 3};
mag_z_5_2 = data_table_mag_5_2{:, 4};

mu_mag_x_5_2	= mean(mag_x_5_2);
sig2_mag_x_5_2	= var(mag_x_5_2);

mu_mag_y_5_2	= mean(mag_y_5_2);
sig2_mag_y_5_2	= var(mag_y_5_2);

mu_mag_z_5_2	= mean(mag_z_5_2);
sig2_mag_z_5_2	= var(mag_z_5_2);


mu_mag_5_2      = [mu_mag_x_5_2;mu_mag_y_5_2;mu_mag_z_5_2];
bias_mag_5_2	= [mu_mag_x_5_2;mu_mag_y_5_2;mu_mag_z_5_2] - [0;19.729;-47.6421]	;% muT
var_mag_5_2		= diag([sig2_mag_x_5_2 sig2_mag_y_5_2 sig2_mag_z_5_2]);

xlswrite('Data.xls',[mu_acc_5_2 tru_acc_5 bias_acc_5_2 var_acc_5_2],'sheet1','E67');
xlswrite('Data.xls',[mu_gyro_5_2 tru_gyro_5 bias_gyro_5_2 var_gyro_5_2],'sheet2','E67');
xlswrite('Data.xls',[mu_mag_5_2 tru_mag_5 bias_mag_5_2 var_mag_5_2],'sheet3','E67');

%% OPEN TABLES 
data_table_acc_5_3   = readtable('Accelerometer_5_3.csv');
data_table_gyro_5_3  = readtable('Gyroscope_5_3.csv');
data_table_mag_5_3   = readtable('Magnetometer_5_3.csv');


g = 9.80328;
tru_acc_5  = [0;0;g];
tru_gyro_5 = [0;0;0];
tru_mag_5  = [0;19.729;-47.6421];
%% Accelerometers

acc_x_5_3   = data_table_acc_5_3{:,2};
acc_y_5_3   = data_table_acc_5_3{:,3}; 
acc_z_5_3   = data_table_acc_5_3{:,4};

mu_acc_x_5_3	= mean(acc_x_5_3);
sig2_acc_x_5_3	= var(acc_x_5_3);

mu_acc_y_5_3	=  mean(acc_y_5_3);
sig2_acc_y_5_3	= var(acc_y_5_3);

mu_acc_z_5_3	= mean(acc_z_5_3);
sig2_acc_z_5_3	= var(acc_z_5_3);

mu_acc_5_3      = [mu_acc_x_5_3; mu_acc_y_5_3; mu_acc_z_5_3];
bias_acc_5_3    = [mu_acc_x_5_3; mu_acc_y_5_3; mu_acc_z_5_3] - [0;0;g]		;% m/s/s
var_acc_5_3		= diag([sig2_acc_x_5_3 sig2_acc_y_5_3 sig2_acc_z_5_3]);

%% Gryroscopes

gyro_x_5_3 = data_table_gyro_5_3{:, 2};
gyro_y_5_3 = data_table_gyro_5_3{:, 3};
gyro_z_5_3 = data_table_gyro_5_3{:, 4};


mu_gyro_x_5_3	= mean(gyro_x_5_3);
sig2_gyro_x_5_3	= var(gyro_x_5_3);

mu_gyro_y_5_3	= mean(gyro_y_5_3);
sig2_gyro_y_5_3 = var(gyro_y_5_3);

mu_gyro_z_5_3	= mean(gyro_z_5_3);
sig2_gyro_z_5_3	= var(gyro_z_5_3);

mu_gyro_5_3     = [mu_gyro_x_5_3; mu_gyro_y_5_3; mu_gyro_z_5_3];
bias_gyro_5_3	= -[mu_gyro_x_5_3; mu_gyro_y_5_3; mu_gyro_z_5_3]				;% rad/s
var_gyro_5_3	= diag([sig2_gyro_x_5_3 sig2_gyro_y_5_3 sig2_gyro_z_5_3]);


%% Magnetometers

mag_x_5_3 = data_table_mag_5_3{:, 2};
mag_y_5_3 = data_table_mag_5_3{:, 3};
mag_z_5_3 = data_table_mag_5_3{:, 4};

mu_mag_x_5_3	= mean(mag_x_5_3);
sig2_mag_x_5_3	= var(mag_x_5_3);

mu_mag_y_5_3	= mean(mag_y_5_3);
sig2_mag_y_5_3	= var(mag_y_5_3);

mu_mag_z_5_3	= mean(mag_z_5_3);
sig2_mag_z_5_3	= var(mag_z_5_3);


mu_mag_5_3      = [mu_mag_x_5_3;mu_mag_y_5_3;mu_mag_z_5_3];
bias_mag_5_3	= [mu_mag_x_5_3;mu_mag_y_5_3;mu_mag_z_5_3] - [0;19.729;-47.6421]	;% muT
var_mag_5_3		= diag([sig2_mag_x_5_3 sig2_mag_y_5_3 sig2_mag_z_5_3]);

xlswrite('Data.xls',[mu_acc_5_3 tru_acc_5 bias_acc_5_3 var_acc_5_3],'sheet1','E70');
xlswrite('Data.xls',[mu_gyro_5_3 tru_gyro_5 bias_gyro_5_3 var_gyro_5_3],'sheet2','E70');
xlswrite('Data.xls',[mu_mag_5_3 tru_mag_5 bias_mag_5_3 var_mag_5_3],'sheet3','E70');

%% OPEN TABLES 
data_table_acc_5_4   = readtable('Accelerometer_5_4.csv');
data_table_gyro_5_4  = readtable('Gyroscope_5_4.csv');
data_table_mag_5_4   = readtable('Magnetometer_5_4.csv');


g = 9.80328;
tru_acc_5  = [0;0;g];
tru_gyro_5 = [0;0;0];
tru_mag_5  = [0;19.729;-47.6421];
%% Accelerometers

acc_x_5_4   = data_table_acc_5_4{:,2};
acc_y_5_4   = data_table_acc_5_4{:,3}; 
acc_z_5_4   = data_table_acc_5_4{:,4};

mu_acc_x_5_4	= mean(acc_x_5_4);
sig2_acc_x_5_4	= var(acc_x_5_4);

mu_acc_y_5_4	=  mean(acc_y_5_4);
sig2_acc_y_5_4	= var(acc_y_5_4);

mu_acc_z_5_4	= mean(acc_z_5_4);
sig2_acc_z_5_4	= var(acc_z_5_4);

mu_acc_5_4      = [mu_acc_x_5_4; mu_acc_y_5_4; mu_acc_z_5_4];
bias_acc_5_4    = [mu_acc_x_5_4; mu_acc_y_5_4; mu_acc_z_5_4] - [0;0;g]		;% m/s/s
var_acc_5_4		= diag([sig2_acc_x_5_4 sig2_acc_y_5_4 sig2_acc_z_5_4]);

%% Gryroscopes

gyro_x_5_4 = data_table_gyro_5_4{:, 2};
gyro_y_5_4 = data_table_gyro_5_4{:, 3};
gyro_z_5_4 = data_table_gyro_5_4{:, 4};


mu_gyro_x_5_4	= mean(gyro_x_5_4);
sig2_gyro_x_5_4	= var(gyro_x_5_4);

mu_gyro_y_5_4	= mean(gyro_y_5_4);
sig2_gyro_y_5_4 = var(gyro_y_5_4);

mu_gyro_z_5_4	= mean(gyro_z_5_4);
sig2_gyro_z_5_4	= var(gyro_z_5_4);

mu_gyro_5_4     = [mu_gyro_x_5_4; mu_gyro_y_5_4; mu_gyro_z_5_4];
bias_gyro_5_4	= -[mu_gyro_x_5_4; mu_gyro_y_5_4; mu_gyro_z_5_4]				;% rad/s
var_gyro_5_4	= diag([sig2_gyro_x_5_4 sig2_gyro_y_5_4 sig2_gyro_z_5_4]);


%% Magnetometers

mag_x_5_4 = data_table_mag_5_4{:, 2};
mag_y_5_4 = data_table_mag_5_4{:, 3};
mag_z_5_4 = data_table_mag_5_4{:, 4};

mu_mag_x_5_4	= mean(mag_x_5_4);
sig2_mag_x_5_4	= var(mag_x_5_4);

mu_mag_y_5_4	= mean(mag_y_5_4);
sig2_mag_y_5_4	= var(mag_y_5_4);

mu_mag_z_5_4	= mean(mag_z_5_4);
sig2_mag_z_5_4	= var(mag_z_5_4);


mu_mag_5_4      = [mu_mag_x_5_4;mu_mag_y_5_4;mu_mag_z_5_4];
bias_mag_5_4	= [mu_mag_x_5_4;mu_mag_y_5_4;mu_mag_z_5_4] - [0;19.729;-47.6421]	;% muT
var_mag_5_4		= diag([sig2_mag_x_5_4 sig2_mag_y_5_4 sig2_mag_z_5_4]);

xlswrite('Data.xls',[mu_acc_5_4 tru_acc_5 bias_acc_5_4 var_acc_5_4],'sheet1','E73');
xlswrite('Data.xls',[mu_gyro_5_4 tru_gyro_5 bias_gyro_5_4 var_gyro_5_4],'sheet2','E73');
xlswrite('Data.xls',[mu_mag_5_4 tru_mag_5 bias_mag_5_4 var_mag_5_4],'sheet3','E73');

%% OPEN TABLES 
data_table_acc_5_5   = readtable('Accelerometer_5_5.csv');
data_table_gyro_5_5  = readtable('Gyroscope_5_5.csv');
data_table_mag_5_5   = readtable('Magnetometer_5_5.csv');


g = 9.80328;
tru_acc_5  = [0;0;g];
tru_gyro_5 = [0;0;0];
tru_mag_5  = [0;19.729;-47.6421];
%% Accelerometers

acc_x_5_5   = data_table_acc_5_5{:,2};
acc_y_5_5   = data_table_acc_5_5{:,3}; 
acc_z_5_5   = data_table_acc_5_5{:,4};

mu_acc_x_5_5	= mean(acc_x_5_5);
sig2_acc_x_5_5	= var(acc_x_5_5);

mu_acc_y_5_5	=  mean(acc_y_5_5);
sig2_acc_y_5_5	= var(acc_y_5_5);

mu_acc_z_5_5	= mean(acc_z_5_5);
sig2_acc_z_5_5	= var(acc_z_5_5);

mu_acc_5_5      = [mu_acc_x_5_5; mu_acc_y_5_5; mu_acc_z_5_5];
bias_acc_5_5    = [mu_acc_x_5_5; mu_acc_y_5_5; mu_acc_z_5_5] - [0;0;g]		;% m/s/s
var_acc_5_5		= diag([sig2_acc_x_5_5 sig2_acc_y_5_5 sig2_acc_z_5_5]);

%% Gryroscopes

gyro_x_5_5 = data_table_gyro_5_5{:, 2};
gyro_y_5_5 = data_table_gyro_5_5{:, 3};
gyro_z_5_5 = data_table_gyro_5_5{:, 4};


mu_gyro_x_5_5	= mean(gyro_x_5_5);
sig2_gyro_x_5_5	= var(gyro_x_5_5);

mu_gyro_y_5_5	= mean(gyro_y_5_5);
sig2_gyro_y_5_5 = var(gyro_y_5_5);

mu_gyro_z_5_5	= mean(gyro_z_5_5);
sig2_gyro_z_5_5	= var(gyro_z_5_5);

mu_gyro_5_5     = [mu_gyro_x_5_5; mu_gyro_y_5_5; mu_gyro_z_5_5];
bias_gyro_5_5	= -[mu_gyro_x_5_5; mu_gyro_y_5_5; mu_gyro_z_5_5]				;% rad/s
var_gyro_5_5	= diag([sig2_gyro_x_5_5 sig2_gyro_y_5_5 sig2_gyro_z_5_5]);


%% Magnetometers

mag_x_5_5 = data_table_mag_5_5{:, 2};
mag_y_5_5 = data_table_mag_5_5{:, 3};
mag_z_5_5 = data_table_mag_5_5{:, 4};

mu_mag_x_5_5	= mean(mag_x_5_5);
sig2_mag_x_5_5	= var(mag_x_5_5);

mu_mag_y_5_5	= mean(mag_y_5_5);
sig2_mag_y_5_5	= var(mag_y_5_5);

mu_mag_z_5_5	= mean(mag_z_5_5);
sig2_mag_z_5_5	= var(mag_z_5_5);


mu_mag_5_5      = [mu_mag_x_5_5;mu_mag_y_5_5;mu_mag_z_5_5];
bias_mag_5_5	= [mu_mag_x_5_5;mu_mag_y_5_5;mu_mag_z_5_5] - [0;19.729;-47.6421]	;% muT
var_mag_5_5		= diag([sig2_mag_x_5_5 sig2_mag_y_5_5 sig2_mag_z_5_5]);

xlswrite('Data.xls',[mu_acc_5_5 tru_acc_5 bias_acc_5_5 var_acc_5_5],'sheet1','E76');
xlswrite('Data.xls',[mu_gyro_5_5 tru_gyro_5 bias_gyro_5_5 var_gyro_5_5],'sheet2','E76');
xlswrite('Data.xls',[mu_mag_5_5 tru_mag_5 bias_mag_5_5 var_mag_5_5],'sheet3','E76');
clc

%% PLOTS
figure(1)
sgtitle('Case 1 Set 2 Accelerometer')

subplot(311)
plot(data_table_acc_1_2{:,1},acc_x_1_2,'Linewidth',2)
xlabel('time(s)');ylabel('Accel (m/s/s)'); title('X-Accel')
hold on 

subplot(312)
plot(data_table_acc_1_2{:,1},acc_y_1_2,'Linewidth',2)
xlabel('time(s)');ylabel('Accel (m/s/s)'); title('Y-Accel')
hold on 

subplot(313)
plot(data_table_acc_1_2{:,1},acc_z_1_2,'Linewidth',2)
xlabel('time(s)');ylabel('Accel (m/s/s)'); title('Z-Accel')
hold off

figure(2)
sgtitle('Case 1 Set 3 Gyroscope')

subplot(311)
plot(data_table_gyro_1_3{:,1},gyro_x_1_3,'Linewidth',2)
xlabel('time(s)');ylabel('rad/s'); title('X-Axis')
hold on 

subplot(312)
plot(data_table_gyro_1_3{:,1},gyro_y_1_3,'Linewidth',2)
xlabel('time(s)');ylabel('rad/s'); title('Y-Axis')
hold on 

subplot(313)
plot(data_table_gyro_1_3{:,1},gyro_z_1_3,'Linewidth',2)
xlabel('time(s)');ylabel('rad/s'); title('Z-Axis')
hold off

figure(3)
sgtitle('Case 1 Set 3 Magnetometer')

subplot(311)
plot(data_table_mag_1_3{:,1},mag_x_1_3,'Linewidth',2)
xlabel('time(s)');ylabel('micro Teslas'); title('X-Axis')
hold on 

subplot(312)
plot(data_table_mag_1_3{:,1},mag_y_1_3,'Linewidth',2)
xlabel('time(s)');ylabel('micro Teslas'); title('Y-Axis')
hold on 

subplot(313)
plot(data_table_mag_1_3{:,1},mag_z_1_3,'Linewidth',2)
xlabel('time(s)');ylabel('micro Teslas'); title('Z-Axis')
hold off



