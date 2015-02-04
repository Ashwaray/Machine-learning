image = zeros(512,512);
river = zeros(50,4);
nonriver = zeros(100,4);

I1=imread('E:\6 Semester\soft computing\Satellite\band1.gif');
I2=imread('E:\6 Semester\soft computing\Satellite\band2.gif');
I3=imread('E:\6 Semester\soft computing\Satellite\band3.gif');
I4=imread('E:\6 Semester\soft computing\Satellite\band4.gif');

mean_r1 = 0;mean_nr1 = 0 ; mean_r2 = 0;mean_nr2 = 0 ; mean_r3 = 0;mean_nr3 = 0 ; mean_r4 = 0;mean_nr4 = 0;
x = 0; y =0;
%imshow(I1);
%[xr,yr] = ginput(50);
A = [xr,yr];

for i = 1 : 50
    x = int64(xr(i));
    y = int64(yr(i));
    mean_r1 = mean_r1 + I1(x,y);
    mean_r2 = mean_r2 + I2(x,y);
    mean_r3 = mean_r3 + I3(x,y);
    mean_r4 = mean_r4 + I4(x,y);
  % To calculate covariance  
    river(i,1)= I1(x,y);
    river(i,2)= I2(x,y);
    river(i,3)= I3(x,y);
    river(i,4)= I4(x,y); 
end
T1 = [mean_r1,mean_r2,mean_r3,mean_r4];

%[xnr,ynr] = ginput(100);

B = [xnr,ynr];

for i = 1 : 100
    x = int32(xnr(i));
    y = int32(ynr(i));
    mean_nr1 = mean_nr1 + I1(x,y);
    mean_nr2 = mean_nr2 + I2(x,y);
    mean_nr3 = mean_nr3 + I3(x,y);
    mean_nr4 = mean_nr4 + I4(x,y);
  % To calculate covariance  
    nonriver(i,1)= I1(x,y);
    nonriver(i,2)= I2(x,y);
    nonriver(i,3)= I3(x,y);
    nonriver(i,4)= I4(x,y);
end
T2 = [mean_nr1,mean_nr2,mean_nr3,mean_nr4];

cvr=cov(river);
cvnr=cov(nonriver);
inv1=inv(cvnr);
inv2=inv(cvr);
det1=det(cvnr);
det2=det(cvr);

test_data = [I1,I2,I3,I4]; 


for i=1:512
    for j=1:512
        
val1=double([I1(i,j),I2(i,j),I3(i,j),I4(i,j)])';
numr1=transpose(mnr-val1)*inv1*(mnr-val1);
deno1=(2*pi)*(sqrt(det1));
numr2=transpose(mr-val1)*inv2*(mr-val1);
deno2=(2*pi)*(sqrt(det2));
connr=(-0.5)*exp(numr1)/deno1;
conr=(-0.5)*exp(numr2)/deno2;
    ppnr=0.5*connr;
    ppr=0.5*conr;
    if(ppnr>=ppr)
      image(i,j)=0;
    else
       image(i,j)=255;
    end  
    end
end
    
imshow(image)




