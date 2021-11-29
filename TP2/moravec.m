function [a, R] = moravec(image, w)

    % width(size) of the weighting function
	I = image;
    [row, col] = size(I);

    % convert the image to double
    if( ~isa(I, 'double'))
	I = double(I);
    end

    %uv = [[1 0]; [1 1]; [0 1]; [-1 1]]
     uv=[];
     
     for x=-5:2:5
         for y=-5:2:5
             uv=[uv; [x y]];
         end
     end
     
    E = zeros(size(uv, 1), row, col);
    weight = ones(w);
  

    % calculate E of Moravec corner detector
    len=size(uv,1);
    for i = 1:len
	shiftI = circshift(I, uv(i,:));
	diffI = shiftI - I;
	ssdI = abs(diffI) ; % sum of squared differences
	E(i,:,:) = conv2(ssdI, weight, 'same'); % summation of weighted ssd
    end

    minE = reshape(min(E), row, col);

    % local maxima
    
    mat=ones(w);
    r=( w+1)/2;
    mat(r,r)=0;
    R = minE > imdilate(minE, mat);
    [featureY, featureX] = find(R);
    a=[featureX' ;featureY'];
    a=a';
    
    
end