function [result]=main(inMp4Path,bgJpgPath,bgMp4Path,outAviPath,midPath)
	obj1 = VideoReader(inMp4Path);
	obj2 = VideoReader(bgMp4Path);
	result = VideoWriter(outAviPath);%初始化一个avi文件
	
	NumOfFrames=min(obj1.NumberOfFrames,obj2.NumberOfFrames);
	
	open(result);
	for i=1:NumOfFrames
	
		inframe = read(obj1,i);
		midframe = read(obj2,i);
		
		filter = makeFilter(inframe,bgJpgPath);%制作滤镜
		midframe = useFilter(filter,midframe,inframe);%使用滤镜
		
		writeVideo(result,midframe);%将结果帧写入视频
        imwrite(midframe,strcat(midPath,'result_',num2str(i),'.jpg')); %输出结果帧
	end
	close(result);%输出视频
end