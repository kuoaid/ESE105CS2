% Part 2 3.5
figure;
plot(coviddata);
title("coviddata");
figure;
spead = diff(coviddata);
movspead = movmean(spead,60);
plot(movspead);
title("movspead");
figure;
accele = diff(movmean(spead,60));
movaccele = movmean(accele,60);
plot(movaccele);
title("movaccele");
movaccele_1 = movaccele(:,1);
find0 = @(movaccele_1)find(diff(sign(movaccele_1)));
% disp(find0(movaccele_1));
% phasepoints = find0(movaccele_1);

% Because there's a continues three numbers of 539, 540, 541, so just take
% 540 as the phase point to represent the three.
phasepoints = [275 449 540 590 674 756];
%%
t = 275;
covidda = table2array(COVID_STLmetro(:,5:6));
coviddata = covidda./2737140;
sirafun1= @(x)siroutput(x,t,coviddata(1:275,:));
xnew1 = fmincon(sirafun1,x0,A,b,Af,bf,lb,ub);
Y_fit_1 = siroutput_full(xnew1,t);
Y_fit_1_24 = [Y_fit_1(:,2) Y_fit_1(:,4)];

figure;
hold on;
plot(coviddata);
plot(Y_fit_1_24);
hold off;
legend('cases','deaths');
title("Original data and Y fit for five phases")

%%
begin = 275;
t = 449-begin;
Y_fit_2 = siroutput_full(xnew,t);
Y_fit_2_24 = [Y_fit_2(:,2)+Y_fit_1(end,2) Y_fit_2(:,4)+Y_fit_1(end,4)];

begin = 449;
t = 590-begin;
Y_fit_3 = siroutput_full(xnew,t);
Y_fit_3_24 = [Y_fit_3(:,2)+Y_fit_2(end,2) Y_fit_3(:,4)+Y_fit_2(end,4)];

begin = 590;
t = 674-begin;
Y_fit_4 = siroutput_full(xnew,t);
Y_fit_4_24 = [Y_fit_4(:,2)+Y_fit_3(end,2) Y_fit_4(:,4)+Y_fit_3(end,4)];

begin = 674;
t = 756-begin;
Y_fit_5 = siroutput_full(xnew,t);
Y_fit_5_24 = [Y_fit_5(:,2)+Y_fit_4(end,2) Y_fit_5(:,4)+Y_fit_4(end,4)];

Y_fit_1to5_24 = [Y_fit_1_24; Y_fit_2_24; Y_fit_3_24; Y_fit_4_24; Y_fit_5_24];

figure;
hold on;
plot(coviddata);
plot(Y_fit_1to5_24);
legend('cases','deaths','Y fit deaths', 'Y fit cases');
title("Original data and Y fit for five phases")
hold off;

% figure;
% plot(coviddata(431:605,:));









