classdef watermark
    %WATERMARK Summary of this class goes here
    %   Detailed explanation goes here

    properties
        scanpath %path to the main ct scan image
        imscan %loaded scan image

        logopath %path to logo
        imlogo %logo loaded image, grey level, 64x64

        eprpath %Electronic Patient Record
        eprstr %epr string data

        W %logical array [logo, image, epr]
        eW %encrypted watermark
    end

    methods

        function obj = watermark(scanpath, logopath, eprpath)
            %WATERMARK Construct an instance of this class
            %   Detailed explanation goes here
            obj.scanpath = scanpath;
            obj.logopath = logopath;
            obj.eprpath = eprpath;

            obj.imscan = imread(scanpath);
            obj.imlogo = imread(logopath);
            obj.imlogo = rgb2gray(imresize(logo, [64, 64]));
            obj.eprstr = fileread(obj.eprpath); %reading file text
        end

        function outputArg = method1(obj, inputArg)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            outputArg = obj.Property1 + inputArg;
        end

    end

end
