%QUESTION 1 :
    I = imread ("test_image.bmp");
    w=11;
    [a, R] = moravec(I, w);
    a
    nb_keypoint = size(a,1);
    imshow(I);
    hold on
    plot(a(:,1),a(:,2),'r*');
%QUESTION 2 :
    descripteur = LBP(I,a);
