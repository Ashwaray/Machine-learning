for j=1:4
    t = 0;
    for i=1:50
        temp = ( irisc(i,j)-mean3(1,j) )*(irisc(i,j)-mean3(1,j));
        t = t + temp;
    end
    t = t / 49;
    sd3(1,j)= sqrt(t);
end