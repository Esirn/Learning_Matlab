function [filter]=makeFilter(inframe,bgJpgPath)
	J = length(dir(strcat(bgJpgPath,'*.jpg')));
	bg = cell(1,J);
	
	for j=1:J
		bg{j} = imread( strcat(bgJpgPath, 'bg_', num2str(j), '.jpg'));
	end
	for m=1:720
		for n=1:1280
			filter(m,n)=255;
			for j=1:J
				if (aabbss(inframe(m,n),bg{j}(m,n))<30 )
					filter(m,n)=0;
				end
			end
		end
    end
    filter = bwmorph(filter,'open',2);
    filter = bwmorph(filter,'close',3);
end