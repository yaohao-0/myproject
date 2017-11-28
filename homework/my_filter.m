function image_fil = my_filter(image,type)
%MY_FILTER 此处显示有关此函数的摘要
%   此处显示详细说明
[m, n]=size(image);
b1=image;b2=image;b3=image;
for i = 2:m-1
    for j = 2:n-1        
        con=0; s1=zeros(9,1);
        for k1 = i-1:i+1
            for p1 = j-1:j+1               
                    con = con+1;
                    s1(con)=(image(k1,p1));                                    
            end
        end
        b1(i,j)=min(s1);
        b2(i,j)=max(s1);
        b3(i,j)=median(s1);
    end    
end
if strcmp(type,'min')
    image_fil=b1;
elseif strcmp(type,'max')
    image_fil=b2;
elseif strcmp(type,'median')
    image_fil=b3;
end
end