function varargout = extractionGUI(varargin)
    % EXTRACTIONGUI MATLAB code for extractionGUI.fig
    %      EXTRACTIONGUI, by itself, creates a new EXTRACTIONGUI or raises the existing
    %      singleton*.
    %
    %      H = EXTRACTIONGUI returns the handle to a new EXTRACTIONGUI or the handle to
    %      the existing singleton*.
    %
    %      EXTRACTIONGUI('CALLBACK',hObject,eventData,handles,...) calls the local
    %      function named CALLBACK in EXTRACTIONGUI.M with the given input arguments.
    %
    %      EXTRACTIONGUI('Property','Value',...) creates a new EXTRACTIONGUI or raises the
    %      existing singleton*.  Starting from the left, property value pairs are
    %      applied to the GUI before extractionGUI_OpeningFcn gets called.  An
    %      unrecognized property name or invalid value makes property application
    %      stop.  All inputs are passed to extractionGUI_OpeningFcn via varargin.
    %
    %      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
    %      instance to run (singleton)".
    %
    % See also: GUIDE, GUIDATA, GUIHANDLES

    % Edit the above text to modify the response to help extractionGUI

    % Last Modified by GUIDE v2.5 15-Jun-2021 22:58:34

    % Begin initialization code - DO NOT EDIT
    gui_Singleton = 1;
    gui_State = struct('gui_Name', mfilename, ...
        'gui_Singleton', gui_Singleton, ...
        'gui_OpeningFcn', @extractionGUI_OpeningFcn, ...
        'gui_OutputFcn', @extractionGUI_OutputFcn, ...
        'gui_LayoutFcn', [], ...
        'gui_Callback', []);

    if nargin && ischar(varargin{1})
        gui_State.gui_Callback = str2func(varargin{1});
    end

    if nargout
        [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
    else
        gui_mainfcn(gui_State, varargin{:});
    end

    % End initialization code - DO NOT EDIT
end

% --- Executes just before extractionGUI is made visible.
function extractionGUI_OpeningFcn(hObject, eventdata, handles, varargin)
    % This function has no output args, see OutputFcn.
    % hObject    handle to figure
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user databox (see GUIDATA)
    % varargin   command line arguments to extractionGUI (see VARARGIN)

    % Choose default command line output for extractionGUI
    handles.output = hObject;

    % Update handles structure
    guidata(hObject, handles);

    % UIWAIT makes extractionGUI wait for user response (see UIRESUME)
    % uiwait(handles.figure1);
end

% --- Outputs from this function are returned to the command line.
function varargout = extractionGUI_OutputFcn(hObject, eventdata, handles)
    % varargout  cell array for returning output args (see VARARGOUT);
    % hObject    handle to figure
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user databox (see GUIDATA)

    % Get default command line output from handles structure
    varargout{1} = handles.output;
end

% --- Executes on button press in load.
function load_Callback(hObject, eventdata, handles)
    % hObject    handle to load (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user databox (see GUIDATA)
    [file, path] = uigetfile({'*.*'}, 'File Selector');
    img_path = strcat(path, file);
    I = imread(img_path);
    data = struct('I', I);
    handles.data0 = data;
    handles.scan = img_path;
    axes(handles.original);
    imshow(I);
    guidata(hObject, handles)
end

function pass_Callback(hObject, eventdata, handles)
    % hObject    handle to pass (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user databox (see GUIDATA)

    % Hints: get(hObject,'String') returns contents of pass as text
    %        str2double(get(hObject,'String')) returns contents of pass as a double
    x = get(hObject, 'string');
    data = struct('P', x);
    handles.data1 = data;
    guidata(hObject, handles)
end

% --- Executes during object creation, after setting all properties.
function pass_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to pass (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    empty - handles not created until after all CreateFcns called

    % Hint: edit controls usually have a white background on Windows.
    %       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject, 'BackgroundColor'), get(0, 'defaultUicontrolBackgroundColor'))
        set(hObject, 'BackgroundColor', 'white');
    end

end

% --- Executes on button press in show.
function show_Callback(hObject, eventdata, handles)
    % hObject    handle to show (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user databox (see GUIDATA)
    data0 = handles.data0;
    data1 = handles.data1;
    data2 = handles.data2;
    scanpath = handles.scan;
    keyencryption = data1.P;
    keyscramble = data2.K;

    [logo, eprdata] = extraction(scanpath, keyencryption, keyscramble);

    axes(handles.new);
    imshow(logo);
    fileID = fopen('EPR_extracted.txt', 'w');
    fprintf(fileID, eprdata);
    imwrite(logo, 'logo_extracted.png')
    set(handles.databox, 'String', eprdata);
end

function databox_Callback(hObject, eventdata, handles)
    % hObject    handle to databox (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user databox (see GUIDATA)

    % Hints: get(hObject,'String') returns contents of databox as text
    %        str2double(get(hObject,'String')) returns contents of databox as a double
end

% --- Executes during object creation, after setting all properties.
function databox_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to databox (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    empty - handles not created until after all CreateFcns called

    % Hint: edit controls usually have a white background on Windows.
    %       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject, 'BackgroundColor'), get(0, 'defaultUicontrolBackgroundColor'))
        set(hObject, 'BackgroundColor', 'white');
    end

end

function key_Callback(hObject, eventdata, handles)
    % hObject    handle to key (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user databox (see GUIDATA)

    % Hints: get(hObject,'String') returns contents of key as text
    %        str2double(get(hObject,'String')) returns contents of key as a double
    x = str2double(get(hObject, 'string'));
    data = struct('K', x);
    handles.data2 = data;
    guidata(hObject, handles)
end

% --- Executes during object creation, after setting all properties.
function key_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to key (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    empty - handles not created until after all CreateFcns called

    % Hint: edit controls usually have a white background on Windows.
    %       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject, 'BackgroundColor'), get(0, 'defaultUicontrolBackgroundColor'))
        set(hObject, 'BackgroundColor', 'white');
    end

end
