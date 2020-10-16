%% OPEN TABLES 
data_table_acc_6_1   = readtable('Accelerometer_6_1.csv');
data_table_gyro_6_1  = readtable('Gyroscope_6_1.csv');
data_table_mag_6_1   = readtable('Magnetometer_6_1.csv');


g = 9.80328;
tru_acc_6  = [0;0;g];
tru_gyro_6 = [0;0;0];
tru_mag_6  = [-19.729; -4.9369; -47.6421];
%% Accelerometers

acc_x_6_1   = data_table_acc_6_1{:,2};
acc_y_6_1   = data_table_acc_6_1{:,3}; 
acc_z_6_1   = data_table_acc_6_1{:,4};

mu_acc_x_6_1	= mean(acc_x_6_1);
sig2_acc_x_6_1	= var(acc_x_6_1);

mu_acc_y_6_1	=  mean(acc_y_6_1);
sig2_acc_y_6_1	= var(acc_y_6_1);

mu_acc_z_6_1	= mean(acc_z_6_1);
sig2_acc_z_6_1	= var(acc_z_6_1);

mu_acc_6_1      = [mu_acc_x_6_1; mu_acc_y_6_1; mu_acc_z_6_1];
bias_acc_6_1    = [mu_acc_x_6_1; mu_acc_y_6_1; mu_acc_z_6_1] - [0;0;g];		% m/s/s
var_acc_6_1		= diag([sig2_acc_x_6_1 sig2_acc_y_6_1 sig2_acc_z_6_1]);

%% Gryroscopes

gyro_x_6_1 = data_table_gyro_6_1{:, 2};
gyro_y_6_1 = data_table_gyro_6_1{:, 3};
gyro_z_6_1 = data_table_gyro_6_1{:, 4};


mu_gyro_x_6_1	= mean(gyro_x_6_1);
sig2_gyro_x_6_1	= var(gyro_x_6_1);

mu_gyro_y_6_1	= mean(gyro_y_6_1);
sig2_gyro_y_6_1 = var(gyro_y_6_1);

mu_gyro_z_6_1	= mean(gyro_z_6_1);
sig2_gyro_z_6_1	= var(gyro_z_6_1);

mu_gyro_6_1     = [mu_gyro_x_6_1; mu_gyro_y_6_1; mu_gyro_z_6_1];
bias_gyro_6_1	= -[mu_gyro_x_6_1; mu_gyro_y_6_1; mu_gyro_z_6_1];				% rad/s
var_gyro_6_1	= diag([sig2_gyro_x_6_1 sig2_gyro_y_6_1 sig2_gyro_z_6_1]);


%% Magnetometers

mag_x_6_1 = data_table_mag_6_1{:, 2};
mag_y_6_1 = data_table_mag_6_1{:, 3};
mag_z_6_1 = data_table_mag_6_1{:, 4};

mu_mag_x_6_1	= mean(mag_x_6_1);
sig2_mag_x_6_1	= var(mag_x_6_1);

mu_mag_y_6_1	= mean(mag_y_6_1);
sig2_mag_y_6_1	= var(mag_y_6_1);

mu_mag_z_6_1	= mean(mag_z_6_1);
sig2_mag_z_6_1	= var(mag_z_6_1);


mu_mag_6_1      = [mu_mag_x_6_1;mu_mag_y_6_1;mu_mag_z_6_1];
bias_mag_6_1	= [mu_mag_x_6_1;mu_mag_y_6_1;mu_mag_z_6_1] - [0;19.729;-47.6421];	% muT
var_mag_6_1		= diag([sig2_mag_x_6_1 sig2_mag_y_6_1 sig2_mag_z_6_1]);

xlswrite('Data.xls',[mu_acc_6_1 tru_acc_6 bias_acc_6_1 var_acc_6_1],'sheet1','E79');
xlswrite('Data.xls',[mu_gyro_6_1 tru_gyro_6 bias_gyro_6_1 var_gyro_6_1],'sheet2','E79');
xlswrite('Data.xls',[mu_mag_6_1 tru_mag_6 bias_mag_6_1 var_mag_6_1],'sheet3','E79');

%% OPEN TABLES 
data_table_acc_6_2   = readtable('Accelerometer_6_2.csv');
data_table_gyro_6_2  = readtable('Gyroscope_6_2.csv');
data_table_mag_6_2   = readtable('Magnetometer_6_2.csv');


g = 9.80328;
tru_acc_6  = [0;0;g];
tru_gyro_6 = [0;0;0];
tru_mag_6  = [-19.729; -4.9369; -47.6421];
%% Accelerometers

acc_x_6_2   = data_table_acc_6_2{:,2};
acc_y_6_2   = data_table_acc_6_2{:,3}; 
acc_z_6_2   = data_table_acc_6_2{:,4};

mu_acc_x_6_2	= mean(acc_x_6_2);
sig2_acc_x_6_2	= var(acc_x_6_2);

mu_acc_y_6_2	=  mean(acc_y_6_2);
sig2_acc_y_6_2	= var(acc_y_6_2);

mu_acc_z_6_2	= mean(acc_z_6_2);
sig2_acc_z_6_2	= var(acc_z_6_2);

mu_acc_6_2      = [mu_acc_x_6_2; mu_acc_y_6_2; mu_acc_z_6_2];
bias_acc_6_2    = [mu_acc_x_6_2; mu_acc_y_6_2; mu_acc_z_6_2] - [0;0;g];		% m/s/s
var_acc_6_2		= diag([sig2_acc_x_6_2 sig2_acc_y_6_2 sig2_acc_z_6_2]);

%% Gryroscopes

gyro_x_6_2 = data_table_gyro_6_2{:, 2};
gyro_y_6_2 = data_table_gyro_6_2{:, 3};
gyro_z_6_2 = data_table_gyro_6_2{:, 4};


mu_gyro_x_6_2	= mean(gyro_x_6_2);
sig2_gyro_x_6_2	= var(gyro_x_6_2);

mu_gyro_y_6_2	= mean(gyro_y_6_2);
sig2_gyro_y_6_2 = var(gyro_y_6_2);

mu_gyro_z_6_2	= mean(gyro_z_6_2);
sig2_gyro_z_6_2	= var(gyro_z_6_2);

mu_gyro_6_2     = [mu_gyro_x_6_2; mu_gyro_y_6_2; mu_gyro_z_6_2];
bias_gyro_6_2	= -[mu_gyro_x_6_2; mu_gyro_y_6_2; mu_gyro_z_6_2];				% rad/s
var_gyro_6_2	= diag([sig2_gyro_x_6_2 sig2_gyro_y_6_2 sig2_gyro_z_6_2]);


%% Magnetometers

mag_x_6_2 = data_table_mag_6_2{:, 2};
mag_y_6_2 = data_table_mag_6_2{:, 3};
mag_z_6_2 = data_table_mag_6_2{:, 4};

mu_mag_x_6_2	= mean(mag_x_6_2);
sig2_mag_x_6_2	= var(mag_x_6_2);

mu_mag_y_6_2	= mean(mag_y_6_2);
sig2_mag_y_6_2	= var(mag_y_6_2);

mu_mag_z_6_2	= mean(mag_z_6_2);
sig2_mag_z_6_2	= var(mag_z_6_2);


mu_mag_6_2      = [mu_mag_x_6_2;mu_mag_y_6_2;mu_mag_z_6_2];
bias_mag_6_2	= [mu_mag_x_6_2;mu_mag_y_6_2;mu_mag_z_6_2] - [0;19.729;-47.6421];	% muT
var_mag_6_2		= diag([sig2_mag_x_6_2 sig2_mag_y_6_2 sig2_mag_z_6_2]);

xlswrite('Data.xls',[mu_acc_6_2 tru_acc_6 bias_acc_6_2 var_acc_6_2],'sheet1','E82');
xlswrite('Data.xls',[mu_gyro_6_2 tru_gyro_6 bias_gyro_6_2 var_gyro_6_2],'sheet2','E82');
xlswrite('Data.xls',[mu_mag_6_2 tru_mag_6 bias_mag_6_2 var_mag_6_2],'sheet3','E82');

%% OPEN TABLES 
data_table_acc_6_3   = readtable('Accelerometer_6_3.csv');
data_table_gyro_6_3  = readtable('Gyroscope_6_3.csv');
data_table_mag_6_3   = readtable('Magnetometer_6_3.csv');


g = 9.80328;
tru_acc_6  = [0;0;g];
tru_gyro_6 = [0;0;0];
tru_mag_6  = [-19.729; -4.9369; -47.6421];
%% Accelerometers

acc_x_6_3   = data_table_acc_6_3{:,2};
acc_y_6_3   = data_table_acc_6_3{:,3}; 
acc_z_6_3   = data_table_acc_6_3{:,4};

mu_acc_x_6_3	= mean(acc_x_6_3);
sig2_acc_x_6_3	= var(acc_x_6_3);

mu_acc_y_6_3	=  mean(acc_y_6_3);
sig2_acc_y_6_3	= var(acc_y_6_3);

mu_acc_z_6_3	= mean(acc_z_6_3);
sig2_acc_z_6_3	= var(acc_z_6_3);

mu_acc_6_3      = [mu_acc_x_6_3; mu_acc_y_6_3; mu_acc_z_6_3];
bias_acc_6_3    = [mu_acc_x_6_3; mu_acc_y_6_3; mu_acc_z_6_3] - [0;0;g];		% m/s/s
var_acc_6_3		= diag([sig2_acc_x_6_3 sig2_acc_y_6_3 sig2_acc_z_6_3]);

%% Gryroscopes

gyro_x_6_3 = data_table_gyro_6_3{:, 2};
gyro_y_6_3 = data_table_gyro_6_3{:, 3};
gyro_z_6_3 = data_table_gyro_6_3{:, 4};


mu_gyro_x_6_3	= mean(gyro_x_6_3);
sig2_gyro_x_6_3	= var(gyro_x_6_3);

mu_gyro_y_6_3	= mean(gyro_y_6_3);
sig2_gyro_y_6_3 = var(gyro_y_6_3);

mu_gyro_z_6_3	= mean(gyro_z_6_3);
sig2_gyro_z_6_3	= var(gyro_z_6_3);

mu_gyro_6_3     = [mu_gyro_x_6_3; mu_gyro_y_6_3; mu_gyro_z_6_3];
bias_gyro_6_3	= -[mu_gyro_x_6_3; mu_gyro_y_6_3; mu_gyro_z_6_3];				% rad/s
var_gyro_6_3	= diag([sig2_gyro_x_6_3 sig2_gyro_y_6_3 sig2_gyro_z_6_3]);


%% Magnetometers

mag_x_6_3 = data_table_mag_6_3{:, 2};
mag_y_6_3 = data_table_mag_6_3{:, 3};
mag_z_6_3 = data_table_mag_6_3{:, 4};

mu_mag_x_6_3	= mean(mag_x_6_3);
sig2_mag_x_6_3	= var(mag_x_6_3);

mu_mag_y_6_3	= mean(mag_y_6_3);
sig2_mag_y_6_3	= var(mag_y_6_3);

mu_mag_z_6_3	= mean(mag_z_6_3);
sig2_mag_z_6_3	= var(mag_z_6_3);


mu_mag_6_3      = [mu_mag_x_6_3;mu_mag_y_6_3;mu_mag_z_6_3];
bias_mag_6_3	= [mu_mag_x_6_3;mu_mag_y_6_3;mu_mag_z_6_3] - [0;19.729;-47.6421];	% muT
var_mag_6_3		= diag([sig2_mag_x_6_3 sig2_mag_y_6_3 sig2_mag_z_6_3]);

xlswrite('Data.xls',[mu_acc_6_3 tru_acc_6 bias_acc_6_3 var_acc_6_3],'sheet1','E85');
xlswrite('Data.xls',[mu_gyro_6_3 tru_gyro_6 bias_gyro_6_3 var_gyro_6_3],'sheet2','E85');
xlswrite('Data.xls',[mu_mag_6_3 tru_mag_6 bias_mag_6_3 var_mag_6_3],'sheet3','E85');

%% OPEN TABLES 
data_table_acc_6_4   = readtable('Accelerometer_6_4.csv');
data_table_gyro_6_4  = readtable('Gyroscope_6_4.csv');
data_table_mag_6_4   = readtable('Magnetometer_6_4.csv');


g = 9.80328;
tru_acc_6  = [0;0;g];
tru_gyro_6 = [0;0;0];
tru_mag_6  = [-19.729; -4.9369; -47.6421];
%% Accelerometers

acc_x_6_4   = data_table_acc_6_4{:,2};
acc_y_6_4   = data_table_acc_6_4{:,3}; 
acc_z_6_4   = data_table_acc_6_4{:,4};

mu_acc_x_6_4	= mean(acc_x_6_4);
sig2_acc_x_6_4	= var(acc_x_6_4);

mu_acc_y_6_4	=  mean(acc_y_6_4);
sig2_acc_y_6_4	= var(acc_y_6_4);

mu_acc_z_6_4	= mean(acc_z_6_4);
sig2_acc_z_6_4	= var(acc_z_6_4);

mu_acc_6_4      = [mu_acc_x_6_4; mu_acc_y_6_4; mu_acc_z_6_4];
bias_acc_6_4    = [mu_acc_x_6_4; mu_acc_y_6_4; mu_acc_z_6_4] - [0;0;g];		% m/s/s
var_acc_6_4		= diag([sig2_acc_x_6_4 sig2_acc_y_6_4 sig2_acc_z_6_4]);

%% Gryroscopes

gyro_x_6_4 = data_table_gyro_6_4{:, 2};
gyro_y_6_4 = data_table_gyro_6_4{:, 3};
gyro_z_6_4 = data_table_gyro_6_4{:, 4};


mu_gyro_x_6_4	= mean(gyro_x_6_4);
sig2_gyro_x_6_4	= var(gyro_x_6_4);

mu_gyro_y_6_4	= mean(gyro_y_6_4);
sig2_gyro_y_6_4 = var(gyro_y_6_4);

mu_gyro_z_6_4	= mean(gyro_z_6_4);
sig2_gyro_z_6_4	= var(gyro_z_6_4);

mu_gyro_6_4     = [mu_gyro_x_6_4; mu_gyro_y_6_4; mu_gyro_z_6_4];
bias_gyro_6_4	= -[mu_gyro_x_6_4; mu_gyro_y_6_4; mu_gyro_z_6_4];				% rad/s
var_gyro_6_4	= diag([sig2_gyro_x_6_4 sig2_gyro_y_6_4 sig2_gyro_z_6_4]);


%% Magnetometers

mag_x_6_4 = data_table_mag_6_4{:, 2};
mag_y_6_4 = data_table_mag_6_4{:, 3};
mag_z_6_4 = data_table_mag_6_4{:, 4};

mu_mag_x_6_4	= mean(mag_x_6_4);
sig2_mag_x_6_4	= var(mag_x_6_4);

mu_mag_y_6_4	= mean(mag_y_6_4);
sig2_mag_y_6_4	= var(mag_y_6_4);

mu_mag_z_6_4	= mean(mag_z_6_4);
sig2_mag_z_6_4	= var(mag_z_6_4);


mu_mag_6_4      = [mu_mag_x_6_4;mu_mag_y_6_4;mu_mag_z_6_4];
bias_mag_6_4	= [mu_mag_x_6_4;mu_mag_y_6_4;mu_mag_z_6_4] - [0;19.729;-47.6421];	% muT
var_mag_6_4		= diag([sig2_mag_x_6_4 sig2_mag_y_6_4 sig2_mag_z_6_4]);

xlswrite('Data.xls',[mu_acc_6_4 tru_acc_6 bias_acc_6_4 var_acc_6_4],'sheet1','E88');
xlswrite('Data.xls',[mu_gyro_6_4 tru_gyro_6 bias_gyro_6_4 var_gyro_6_4],'sheet2','E88');
xlswrite('Data.xls',[mu_mag_6_4 tru_mag_6 bias_mag_6_4 var_mag_6_4],'sheet3','E88');


%% OPEN TABLES 
data_table_acc_6_5   = readtable('Accelerometer_6_5.csv');
data_table_gyro_6_5  = readtable('Gyroscope_6_5.csv');
data_table_mag_6_5   = readtable('Magnetometer_6_5.csv');


g = 9.80328;
tru_acc_6  = [0;0;g];
tru_gyro_6 = [0;0;0];
tru_mag_6  = [-19.729; -4.9369; -47.6421];
%% Accelerometers

acc_x_6_5   = data_table_acc_6_5{:,2};
acc_y_6_5   = data_table_acc_6_5{:,3}; 
acc_z_6_5   = data_table_acc_6_5{:,4};

mu_acc_x_6_5	= mean(acc_x_6_5);
sig2_acc_x_6_5	= var(acc_x_6_5);

mu_acc_y_6_5	=  mean(acc_y_6_5);
sig2_acc_y_6_5	= var(acc_y_6_5);

mu_acc_z_6_5	= mean(acc_z_6_5);
sig2_acc_z_6_5	= var(acc_z_6_5);

mu_acc_6_5      = [mu_acc_x_6_5; mu_acc_y_6_5; mu_acc_z_6_5];
bias_acc_6_5    = [mu_acc_x_6_5; mu_acc_y_6_5; mu_acc_z_6_5] - [0;0;g];		% m/s/s
var_acc_6_5		= diag([sig2_acc_x_6_5 sig2_acc_y_6_5 sig2_acc_z_6_5]);

%% Gryroscopes

gyro_x_6_5 = data_table_gyro_6_5{:, 2};
gyro_y_6_5 = data_table_gyro_6_5{:, 3};
gyro_z_6_5 = data_table_gyro_6_5{:, 4};


mu_gyro_x_6_5	= mean(gyro_x_6_5);
sig2_gyro_x_6_5	= var(gyro_x_6_5);

mu_gyro_y_6_5	= mean(gyro_y_6_5);
sig2_gyro_y_6_5 = var(gyro_y_6_5);

mu_gyro_z_6_5	= mean(gyro_z_6_5);
sig2_gyro_z_6_5	= var(gyro_z_6_5);

mu_gyro_6_5     = [mu_gyro_x_6_5; mu_gyro_y_6_5; mu_gyro_z_6_5];
bias_gyro_6_5	= -[mu_gyro_x_6_5; mu_gyro_y_6_5; mu_gyro_z_6_5];				% rad/s
var_gyro_6_5	= diag([sig2_gyro_x_6_5 sig2_gyro_y_6_5 sig2_gyro_z_6_5]);


%% Magnetometers

mag_x_6_5 = data_table_mag_6_5{:, 2};
mag_y_6_5 = data_table_mag_6_5{:, 3};
mag_z_6_5 = data_table_mag_6_5{:, 4};

mu_mag_x_6_5	= mean(mag_x_6_5);
sig2_mag_x_6_5	= var(mag_x_6_5);

mu_mag_y_6_5	= mean(mag_y_6_5);
sig2_mag_y_6_5	= var(mag_y_6_5);

mu_mag_z_6_5	= mean(mag_z_6_5);
sig2_mag_z_6_5	= var(mag_z_6_5);


mu_mag_6_5      = [mu_mag_x_6_5;mu_mag_y_6_5;mu_mag_z_6_5];
bias_mag_6_5	= [mu_mag_x_6_5;mu_mag_y_6_5;mu_mag_z_6_5] - [0;19.729;-47.6421];	% muT
var_mag_6_5		= diag([sig2_mag_x_6_5 sig2_mag_y_6_5 sig2_mag_z_6_5]);

xlswrite('Data.xls',[mu_acc_6_5 tru_acc_6 bias_acc_6_5 var_acc_6_5],'sheet1','E91');
xlswrite('Data.xls',[mu_gyro_6_5 tru_gyro_6 bias_gyro_6_5 var_gyro_6_5],'sheet2','E91');
xlswrite('Data.xls',[mu_mag_6_5 tru_mag_6 bias_mag_6_5 var_mag_6_5],'sheet3','E91');