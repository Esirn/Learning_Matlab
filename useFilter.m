function[midframe] = useFilter(filter,midframe,inframe)
	for m=1:720
		for n=1:1280
			if (filter(m,n)~=0)%旧背景处填入新背景，其他地方填入动作物。
				midframe(m,n,:)=inframe(m,n,:);
			end
		end
	end
end