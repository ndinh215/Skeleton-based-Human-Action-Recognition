clc;
clear;

dataset = 'Northwestern-UCLA';
%dataset = 'NTU RGB+D';

%% Northwestern-UCLA dataset
if dataset == 'Northwestern-UCLA'
    RightHip = 13;
    LeftHip = 17;

    for type = 1:4
        ORDER=[4 3;3 5;5 6;6 7;7 8;8 7;7 6;6 5;5 3;3 2;2 1;1 13;13 14;14 15;15 16;
            16 15;15 14;14 13;13 1;1 17; 17 18;18 19;19 20;20 19;19 18;18 17;
            17 1;1 2;2 3;3 9;9 10;10 11;11 12;12 11;11 10;10 9;9 3;3 4];

        mkdir(['Northwestern-UCLA_img_type_',num2str(type)]);
        Dir = dir(['Northwestern-UCLA_skeleton/','*.mat']);

        for k = 1:size(Dir,1)
            clc;
            disp([size(Dir,1) k]);

            % load data
            file = Dir(k,1).name;
            camera = str2num(file(1,14));
            action = str2num(file(1,2:3));
            load(['Northwestern-UCLA_skeleton/',file]);
            if size(skeleton,3) < 5
                continue;
            end

            img = calPEI(skeleton,type,RightHip,LeftHip,ORDER);

            if camera == 1 || camera == 2
                mkdir(['Northwestern-UCLA_img_type_',num2str(type),'/train/',num2str(action)]);
                imwrite(img,['Northwestern-UCLA_img_type_',num2str(type),'/train/',num2str(action),'/',file(1,1:end-4),'.jpg']);
            end
            if camera == 3
                mkdir(['Northwestern-UCLA_img_type_',num2str(type),'/test/',num2str(action)]);
                imwrite(img,['Northwestern-UCLA_img_type_',num2str(type),'/test/',num2str(action),'/',file(1,1:end-4),'.jpg']);
            end

        end

    end
end


%% NTU RGB+D dataset
if dataset == 'NTU RGB+D'
    RightHip = 13;
    LeftHip = 17;

    for type = 1:4
        ORDER=[4 3;3 21;21 9;9 10;10 11;11 12;12 24;24 12;12 25;25 12;12 11;11 10;10 9;9 21;...
           21 2;2 1;1 17;17 18;18 19;19 20;20 19;19 18;18 17;17 1;1 13;13 14;14 15;15 16;...
           16 15;15 14;14 13;13 1;1 2;2 21;21 5;5 6;6 7;7 8;8 23;23 8;8 22;22 8;...
           8 7;7 6;6 5;5 21;21 3;3 4];

        mkdir(['NTU_img_type_',num2str(type)]);
        Dir = dir(['NTU_skeleton/','*.mat']);

        for k = 1:size(Dir,1)
            clc;
            disp([size(Dir,1) k]);

            % load data
            file = Dir(k,1).name;
            camera = str2num(file(1,6:8));
            action = str2num(file(1,18:20));
            load(['NTU_skeleton/',file]);
            if size(skeleton,3) < 5
                continue;
            end

            img = calPEI(skeleton,type,RightHip,LeftHip,ORDER);

            if camera == 2 || camera == 3
                mkdir(['NTU_img_type_',num2str(type),'/train/',num2str(action)]);
                imwrite(img,['NTU_img_type_',num2str(type),'/train/',num2str(action),'/',file(1,1:end-4),'.jpg']);
            end
            if camera == 1
                mkdir(['NTU_img_type_',num2str(type),'/test/',num2str(action)]);
                imwrite(img,['NTU_img_type_',num2str(type),'/test/',num2str(action),'/',file(1,1:end-4),'.jpg']);
            end

        end

    end
end










