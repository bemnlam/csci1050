function varargout = asg_1050(varargin)
% ASG_1050 MATLAB code for asg_1050.fig
%      ASG_1050, by itself, creates a new ASG_1050 or raises the existing
%      singleton*.
%
%      H = ASG_1050 returns the handle to a new ASG_1050 or the handle to
%      the existing singleton*.
%
%      ASG_1050('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ASG_1050.M with the given input arguments.
%
%      ASG_1050('Property','Value',...) creates a new ASG_1050 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before asg_1050_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to asg_1050_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help asg_1050

% Last Modified by GUIDE v2.5 17-Apr-2014 22:40:04

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @asg_1050_OpeningFcn, ...
                   'gui_OutputFcn',  @asg_1050_OutputFcn, ...
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

global handles1;
% --- Executes just before asg_1050 is made visible.
function asg_1050_OpeningFcn(hObject, eventdata, handles, varargin)
global handles1;
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to asg_1050 (see VARARGIN)

% Choose default command line output for asg_1050
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
handles1 = handles;
% UIWAIT makes asg_1050 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = asg_1050_OutputFcn(hObject, eventdata, handles) 
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
    imshow('image.png');

global area_in;

function [bestD,bestL,minCost] = est_para()
    
    bestD = fminbnd(@calCost,0,100);
    bestL = calL(bestD);
    minCost = calCost(bestD);

function L = calL(D)
    global area_in;
    area = area_in;
    % L = (area- ((pi.*R.^2)./2))./(2.*R);
    L = (area - (D*D)/2 )/(sqrt(2)*D);

function cost = calCost(D)
    % cost = (calL(R)*2+2*R)*30 + (pi*R)*40;
    cost = (calL(D)*2+sqrt(2)*D)*30 + (D*2)*40;

% --- Executes on button press in cal_btn.
function cal_btn_Callback(hObject, eventdata, handles)
    global area_in;
    global handles1;
% hObject    handle to cal_btn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    %d_in = str2double(get(handles.d_txt, 'String'));
    %l_in = str2double(get(handles.l_txt, 'String'));
    %w_in = str2double(get(handles.w_txt, 'String'));
    % result = d_in+l_in+w_in;
    fence_area = str2double(get(handles1.area_txt, 'String'))
    %fence_area = 1000;
    area_in = fence_area;
    
    if area_in<=0
        % empty all fields
        set(handles1.cost_txt,'String', '');
        set(handles1.d_txt,'String', '');
        set(handles1.l_txt,'String', '');
        set(handles1.w_txt,'String', '');
    else
        % do calculation
        [d_out,l_out,cost_out] = est_para();
        w_out = sqrt(2)*d_out;
        set(handles1.cost_txt,'String', num2str(cost_out,'%.1f'));
        set(handles1.d_txt,'String', num2str(d_out,'%.1f'));
        set(handles1.l_txt,'String', num2str(l_out,'%.1f'));
        set(handles1.w_txt,'String', num2str(w_out,'%.1f'));
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
