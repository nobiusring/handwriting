function handwriting(wd)
db = double(wd);
for m = 1:length(db)
    word(char(db(m)));
end
print(wd, '-dpng')
end


function word( msg )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
str = string (msg);
name = strcat(str,'.png');
nam = char(name);
A = imread(nam);
A1 = rgb2gray(A);
BW = imbinarize(A1);
B = bwboundaries(1-BW); 
for i = 1:length(B)  
   p = B{i};
   if length(p)>100
     p1 = p(:,1);
     p11 = p1(1:round(length(p1)/30): length(p1));
     p2 = p(:,2);
     p21 = p2(1:round(length(p2)/30): length(p2));
     P1 = pchip((0:length(p11)-1),p11,(0:.1:length(p11)));
     P2 = pchip((0:length(p21)-1),p21,(0:.1:length(p21)));
     plot(p1,p2)
     hold on
     i = i+1;
   end
end

end

