function varargout = embedding_gui(varargin)
    % EMBEDDING_GUI MATLAB code for embedding_gui.fig
    %      EMBEDDING_GUI, by itself, creates a new EMBEDDING_GUI or raises the existing
    %      singleton*.
    %
    %      H = EMBEDDING_GUI returns the handle to a new EMBEDDING_GUI or the handle to
    %      the existing singleton*.
    %
    %      EMBEDDING_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
    %      function named CALLBACK in EMBEDDING_GUI.M with the given input arguments.
    %
    %      EMBEDDING_GUI('Property','Value',...) creates a new EMBEDDING_GUI or raises the
    %      existing singleton*.  Starting from the left, property value pairs are
    %      applied to the GUI before embedding_gui_OpeningFcn gets called.  An
    %      unrecognized property name or invalid value makes property application
    %      stop.  All inputs are passed to embedding_gui_OpeningFcn via varargin.
    %
    %      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
    %      instance to run (singleton)".
    %
    % See also: GUIDE, GUIDATA, GUIHANDLES

    % Edit the above text to modify the response to help embedding_gui

    % Last Modified by GUIDE v2.5 14-Jun-2021 15:20:24

    % Begin initialization code - DO NOT EDIT
    gui_Singleton = 1;
    gui_State = struct('gui_Name', mfilename, ...
        'gui_Singleton', gui_Singleton, ...
        'gui_OpeningFcn', @embedding_gui_OpeningFcn, ...
        'gui_OutputFcn', @embedding_gui_OutputFcn, ...
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

% --- Executes just before embedding_gui is made visible.
function embedding_gui_OpeningFcn(hObject, eventdata, handles, varargin)
    % This function has no output args, see OutputFcn.
    % hObject    handle to figure
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    % varargin   command line arguments to embedding_gui (see VARARGIN)

    % Choose default command line output for embedding_gui
    handles.output = hObject;

    % Update handles structure
    guidata(hObject, handles);

    % UIWAIT makes embedding_gui wait for user response (see UIRESUME)
    % uiwait(handles.figure1);
end

% --- Outputs from this function are returned to the command line.
function varargout = embedding_gui_OutputFcn(hObject, eventdata, handles)
    % varargout  cell array for returning output args (see VARARGOUT);
    % hObject    handle to figure
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)

    % Get default command line output from handles structure
    varargout{1} = handles.output;
end

% --- Executes on button press in select_btn.
function select_btn_Callback(hObject, eventdata, handles)
    % hObject    handle to select_btn (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    [file, path] = uigetfile({'*.*'}, 'File Selector');
    img_path = strcat(path, file);
    handles.scan = img_path;
    guidata(hObject, handles);
    img = imread(img_path);
    axes(handles.axes1);
    imshow(img);
    title("Original Image");
end

% --- Executes on button press in embed_btn.
function embed_btn_Callback(hObject, eventdata, handles)
    % hObject    handle to embed_btn (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    scanpath = handles.scan;
    logopath = handles.logo;
    eprpath = handles.file;
    keyencryption = get(handles.ecrypt_text, 'String');
    keyscramble = get(handles.encrypt_code, 'String');
    keyscramble = str2double(keyscramble);

    finalim = embedding(scanpath, logopath, eprpath, keyencryption, keyscramble);

    axes(handles.axes2);
    imshow(finalim);
    title("Embedded Image");

    imwrite(finalim, 'ctscan_watermarked.png');

end

% --- Executes on button press in logo_btn.
function logo_btn_Callback(hObject, eventdata, handles)
    % hObject    handle to logo_btn (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    [file, path] = uigetfile({'*.*'}, 'File Selector');
    img_path = strcat(path, file);
    handles.logo = img_path;
    guidata(hObject, handles);
end

% --- Executes on button press in patient_btn.
function patient_btn_Callback(hObject, eventdata, handles)
    % hObject    handle to patient_btn (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    [file, path] = uigetfile({'*.txt*'}, 'File Selector');
    file_path = strcat(path, file);
    handles.file = file_path;
    guidata(hObject, handles);
end

function ecrypt_text_Callback(hObject, eventdata, handles)
    % hObject    handle to ecrypt_text (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)

    % Hints: get(hObject,'String') returns contents of ecrypt_text as text
    %        str2double(get(hObject,'String')) returns contents of ecrypt_text as a double
end

% --- Executes during object creation, after setting all properties.
function ecrypt_text_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to ecrypt_text (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    empty - handles not created until after all CreateFcns called

    % Hint: edit controls usually have a white background on Windows.
    %       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject, 'BackgroundColor'), get(0, 'defaultUicontrolBackgroundColor'))
        set(hObject, 'BackgroundColor', 'white');
    end

end

function encrypt_code_Callback(hObject, eventdata, handles)
    % hObject    handle to encrypt_code (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)

    % Hints: get(hObject,'String') returns contents of encrypt_code as text
    %        str2double(get(hObject,'String')) returns contents of encrypt_code as a double
end

% --- Executes during object creation, after setting all properties.
function encrypt_code_CreateFcn(hObject, eventdata, handles)
    % hObject    handle to encrypt_code (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    empty - handles not created until after all CreateFcns called

    % Hint: edit controls usually have a white background on Windows.
    %       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject, 'BackgroundColor'), get(0, 'defaultUicontrolBackgroundColor'))
        set(hObject, 'BackgroundColor', 'white');
    end

end
