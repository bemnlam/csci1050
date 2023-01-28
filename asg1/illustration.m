function varargout = illustration(varargin)
% ILLUSTRATION MATLAB code for illustration.fig
%      ILLUSTRATION, by itself, creates a new ILLUSTRATION or raises the existing
%      singleton*.
%
%      H = ILLUSTRATION returns the handle to a new ILLUSTRATION or the handle to
%      the existing singleton*.
%
%      ILLUSTRATION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ILLUSTRATION.M with the given input arguments.
%
%      ILLUSTRATION('Property','Value',...) creates a new ILLUSTRATION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before illustration_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to illustration_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help illustration

% Last Modified by GUIDE v2.5 17-Apr-2014 21:06:15

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @illustration_OpeningFcn, ...
                   'gui_OutputFcn',  @illustration_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT

% --- Executes just before illustration is made visible.
function illustration_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to illustration (see VARARGIN)

% Choose default command line output for illustration
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes illustration wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = illustration_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1
    axes(hObject)
    imshow('image.png')

global area_in;

function [bestD,bestL,minCost] = est_para()
    
    bestD = fminbnd(@calCost,0,100);
    bestL = calL(bestD);
    minCost = calCost(bestD);

function L = calL(D)
    global area_in
    area = area_in
    % L = (area- ((pi.*R.^2)./2))./(2.*R);
    L = (area - (D*D)/2 )/(sqrt(2)*D)

function cost = calCost(D)
    % cost = (calL(R)*2+2*R)*30 + (pi*R)*40;
    cost = (calL(D)*2+sqrt(2)*D)*30 + (D*2)*40;

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
    global area_in
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    %d_in = str2double(get(handles.d_txt, 'String'));
    %l_in = str2double(get(handles.l_txt, 'String'));
    %w_in = str2double(get(handles.w_txt, 'String'));
    % result = d_in+l_in+w_in;
    
    area_in = str2double(get(handles.area_txt, 'String'));
    
    if area_in<=0
        % empty all fields
        set(handles.cost_txt,'String', '');
        set(handles.d_txt,'String', '');
        set(handles.l_txt,'String', '');
        set(handles.w_txt,'String', '');
    else
        % do calculation
        [d_out,l_out,cost_out] = est_para();
        w_out = sqrt(2)*d_out;
        set(handles.cost_txt,'String', num2str(cost_out,'%.1f'));
        set(handles.d_txt,'String', num2str(d_out,'%.1f'));
        set(handles.l_txt,'String', num2str(l_out,'%.1f'));
        set(handles.w_txt,'String', num2str(w_out,'%.1f'));
    end

function area_txt_Callback(hObject, eventdata, handles)
% hObject    handle to area_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of area_txt as text
%        str2double(get(hObject,'String')) returns contents of area_txt as a double


% --- Executes during object creation, after setting all properties.
function area_txt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to area_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function cost_txt_Callback(hObject, eventdata, handles)
% hObject    handle to cost_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of cost_txt as text
%        str2double(get(hObject,'String')) returns contents of cost_txt as a double


% --- Executes during object creation, after setting all properties.
function cost_txt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cost_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function d_txt_Callback(hObject, eventdata, handles)
% hObject    handle to d_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of d_txt as text
%        str2double(get(hObject,'String')) returns contents of d_txt as a double


% --- Executes during object creation, after setting all properties.
function d_txt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to d_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function l_txt_Callback(hObject, eventdata, handles)
% hObject    handle to l_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of l_txt as text
%        str2double(get(hObject,'String')) returns contents of l_txt as a double


% --- Executes during object creation, after setting all properties.
function l_txt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to l_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function w_txt_Callback(hObject, eventdata, handles)
% hObject    handle to w_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of w_txt as text
%        str2double(get(hObject,'String')) returns contents of w_txt as a double


% --- Executes during object creation, after setting all properties.
function w_txt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to w_txt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
