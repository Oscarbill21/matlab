
function varargout = ic_tester(varargin)
% IC_TESTER MATLAB code for ic_tester.fig
%      IC_TESTER, by itself, creates a new IC_TESTER or raises the existing
%      singleton*.
%
%      H = IC_TESTER returns the handle to a new IC_TESTER or the handle to
%      the existing singleton*.
%
%      IC_TESTER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IC_TESTER.M with the given input arguments.
%
%      IC_TESTER('Property','Value',...) creates a new IC_TESTER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ic_tester_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ic_tester_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ic_tester

% Last Modified by GUIDE v2.5 27-Nov-2016 17:28:30

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ic_tester_OpeningFcn, ...
                   'gui_OutputFcn',  @ic_tester_OutputFcn, ...
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


% --- Executes just before ic_tester is made visible.
function ic_tester_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ic_tester (see VARARGIN)

% Choose default command line output for ic_tester
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
clear n;
global n;
set(handles.text2,'String','Welcome! Click on "Connect" to start');

% UIWAIT makes ic_tester wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ic_tester_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
global n;
contents = get(hObject,'Value');
switch contents
    
    case 2
        n=1;
        
    case 3
        n=2;
        
    case 4
        n=3;
        
    case 5
        n=4;
        
    case 6
        n=5;
        
    case 7
        n=6;
        
end

% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.text2,'String','Connecting...');
clear a;
global a;
a = arduino('COM19');
set(handles.text2,'String','Connected');

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
global n;
if (n==1)
    a.pinMode(13,'output');
    a.pinMode(2,'output');
    a.pinMode(3,'input');
    a.pinMode(4,'output');
    a.pinMode(5,'output');
    a.pinMode(6,'input');
    a.pinMode(7,'input');
    a.pinMode(8,'output');
    a.pinMode(9,'output');
    a.pinMode(10,'input');
    a.pinMode(11,'output');
    a.pinMode(12,'output');
    a.digitalWrite(13,0);
    a.digitalWrite(2,0);
    a.digitalWrite(4,0);
    a.digitalWrite(5,0);
    a.digitalWrite(8,0);
    a.digitalWrite(9,0);
    a.digitalWrite(11,0);
    a.digitalWrite(12,0);
    pause(0.1);
    t11=a.digitalRead(3);
    t12=a.digitalRead(6);
    t13=a.digitalRead(7);
    t14=a.digitalRead(10);
    if (t11==1 && t12==1 && t13==1 && t14==1)
        a.digitalWrite(13,0);
        a.digitalWrite(2,1);
        a.digitalWrite(4,0);
        a.digitalWrite(5,1);
        a.digitalWrite(8,0);
        a.digitalWrite(9,1);
        a.digitalWrite(11,0);
        a.digitalWrite(12,1);
        pause(0.1);
        t21=a.digitalRead(3);
        t22=a.digitalRead(6);
        t23=a.digitalRead(7);
        t24=a.digitalRead(10);
        if (t21==1 && t22==1 && t23==1 && t24==1)
            a.digitalWrite(13,1);
            a.digitalWrite(2,0);
            a.digitalWrite(4,1);
            a.digitalWrite(5,0);
            a.digitalWrite(8,1);
            a.digitalWrite(9,0);
            a.digitalWrite(11,1);
            a.digitalWrite(12,0);
            pause(0.1);
            t31=a.digitalRead(3);
            t32=a.digitalRead(6);
            t33=a.digitalRead(7);
            t34=a.digitalRead(10);
            if (t31==1 && t32==1 && t33==1 && t34==1)
                a.digitalWrite(13,1);
                a.digitalWrite(2,0);
                a.digitalWrite(4,1);
                a.digitalWrite(5,0);
                a.digitalWrite(8,1);
                a.digitalWrite(9,0);
                a.digitalWrite(11,1);
                a.digitalWrite(12,0);
                pause(0.1);
                t41=a.digitalRead(3);
                t42=a.digitalRead(6);
                t43=a.digitalRead(7);
                t44=a.digitalRead(10);
                if (t41==1 && t42==1 && t43==1 && t44==1)
                    set(handles.text2,'String','IC is in working condition');
                else
                    set(handles.text2,'String','Faulty IC');
                end
            else
                set(handles.text2,'String','Faulty IC');
            end
        else
            set(handles.text2,'String','Faulty IC');
        end
    else
        set(handles.text2,'String','Faulty IC');
    end
end

if (n==2)
    a.pinMode(13,'input');
    a.pinMode(2,'output');
    a.pinMode(3,'output');
    a.pinMode(4,'input');
    a.pinMode(5,'output');
    a.pinMode(6,'output');
    a.pinMode(7,'output');
    a.pinMode(8,'output');
    a.pinMode(9,'input');
    a.pinMode(10,'output');
    a.pinMode(11,'output');
    a.pinMode(12,'input');
    a.digitalWrite(2,0);
    a.digitalWrite(3,0);
    a.digitalWrite(5,0);
    a.digitalWrite(6,0);
    a.digitalWrite(7,0);
    a.digitalWrite(8,0);
    a.digitalWrite(10,0);
    a.digitalWrite(11,0);
    pause(0.1);
    t11=a.digitalRead(13);
    t12=a.digitalRead(4);
    t13=a.digitalRead(9);
    t14=a.digitalRead(12);
    if (t11==1 && t12==1 && t13==1 && t14==1)
        a.digitalWrite(2,0);
        a.digitalWrite(3,1);
        a.digitalWrite(5,0);
        a.digitalWrite(6,1);
        a.digitalWrite(7,0);
        a.digitalWrite(8,1);
        a.digitalWrite(10,0);
        a.digitalWrite(11,1);
        pause(0.1);
        t21=a.digitalRead(13);
        t22=a.digitalRead(4);
        t23=a.digitalRead(9);
        t24=a.digitalRead(12);
        if (t21==0 && t22==0 && t23==0 && t24==0)
            a.digitalWrite(2,1);
            a.digitalWrite(3,0);
            a.digitalWrite(5,1);
            a.digitalWrite(6,0);
            a.digitalWrite(7,1);
            a.digitalWrite(8,0);
            a.digitalWrite(10,1);
            a.digitalWrite(11,0);
            pause(0.1);
            t31=a.digitalRead(13);
            t32=a.digitalRead(4);
            t33=a.digitalRead(9);
            t34=a.digitalRead(12);
            if (t31==0 && t32==0 && t33==0 && t34==0)
                a.digitalWrite(2,1);
                a.digitalWrite(3,1);
                a.digitalWrite(5,1);
                a.digitalWrite(6,1);
                a.digitalWrite(7,1);
                a.digitalWrite(8,1);
                a.digitalWrite(10,1);
                a.digitalWrite(11,1);
                pause(0.1);
                t41=a.digitalRead(13);
                t42=a.digitalRead(4);
                t43=a.digitalRead(9);
                t44=a.digitalRead(12);
                if (t41==0 && t42==0 && t43==0 && t44==0)
                    set(handles.text2,'String','IC is in working condition');
                else
                    set(handles.text2,'String','Faulty IC');
                end
            else
                set(handles.text2,'String','Faulty IC');
            end
        else
            set(handles.text2,'String','Faulty IC');
        end
    else
        set(handles.text2,'String','Faulty IC');
    end
end

if (n==3)
    a.pinMode(13,'output');
    a.pinMode(2,'input');
    a.pinMode(3,'output');
    a.pinMode(4,'input');
    a.pinMode(5,'output');
    a.pinMode(6,'input');
    a.pinMode(7,'input');
    a.pinMode(8,'output');
    a.pinMode(9,'input');
    a.pinMode(10,'output');
    a.pinMode(11,'input');
    a.pinMode(12,'output');
    a.digitalWrite(13,1);
    a.digitalWrite(3,1);
    a.digitalWrite(5,1);
    a.digitalWrite(8,1);
    a.digitalWrite(10,1);
    a.digitalWrite(12,1);
    pause(0.1);
    t11=a.digitalRead(2);
    t12=a.digitalRead(4);
    t13=a.digitalRead(6);
    t14=a.digitalRead(7);
    t15=a.digitalRead(9);
    t16=a.digitalRead(11);
    if (t11==0 && t12==0 && t13==0 && t14==0 && t15==0 && t16==0)
        a.digitalWrite(13,0);
        a.digitalWrite(3,0);
        a.digitalWrite(5,0);
        a.digitalWrite(8,0);
        a.digitalWrite(10,0);
        a.digitalWrite(12,0);
        pause(0.1);
        t11=a.digitalRead(2);
        t12=a.digitalRead(4);
        t13=a.digitalRead(6);
        t14=a.digitalRead(7);
        t15=a.digitalRead(9);
        t16=a.digitalRead(11);
        if (t11==1 && t12==1 && t13==1 && t14==1 && t15==1 && t16==1)
            set(handles.text2,'String','IC is in working condition');
        else
            set(handles.text2,'String','Faulty IC');
        end
    else
        set(handles.text2,'String','Faulty IC');
    end
end

if (n==4)
    a.pinMode(13,'output');
    a.pinMode(2,'output');
    a.pinMode(3,'input');
    a.pinMode(4,'output');
    a.pinMode(5,'output');
    a.pinMode(6,'input');
    a.pinMode(7,'input');
    a.pinMode(8,'output');
    a.pinMode(9,'output');
    a.pinMode(10,'input');
    a.pinMode(11,'output');
    a.pinMode(12,'output');
    a.digitalWrite(13,0);
    a.digitalWrite(2,0);
    a.digitalWrite(4,0);
    a.digitalWrite(5,0);
    a.digitalWrite(8,0);
    a.digitalWrite(9,0);
    a.digitalWrite(11,0);
    a.digitalWrite(12,0);
    pause(0.1);
    t11=a.digitalRead(3);
    t12=a.digitalRead(6);
    t13=a.digitalRead(7);
    t14=a.digitalRead(10);
    if (t11==0 && t12==0 && t13==0 && t14==0)
        a.digitalWrite(13,0);
        a.digitalWrite(2,1);
        a.digitalWrite(4,0);
        a.digitalWrite(5,1);
        a.digitalWrite(8,0);
        a.digitalWrite(9,1);
        a.digitalWrite(11,0);
        a.digitalWrite(12,1);
        pause(0.1);
        t21=a.digitalRead(3);
        t22=a.digitalRead(6);
        t23=a.digitalRead(7);
        t24=a.digitalRead(10);
        if (t21==0 && t22==0 && t23==0 && t24==0)
            a.digitalWrite(13,1);
            a.digitalWrite(2,0);
            a.digitalWrite(4,1);
            a.digitalWrite(5,0);
            a.digitalWrite(8,1);
            a.digitalWrite(9,0);
            a.digitalWrite(11,1);
            a.digitalWrite(12,0);
            pause(0.1);
            t31=a.digitalRead(3);
            t32=a.digitalRead(6);
            t33=a.digitalRead(7);
            t34=a.digitalRead(10);
            if (t31==0 && t32==0 && t33==0 && t34==0)
                a.digitalWrite(13,1);
                a.digitalWrite(2,1);
                a.digitalWrite(4,1);
                a.digitalWrite(5,1);
                a.digitalWrite(8,1);
                a.digitalWrite(9,1);
                a.digitalWrite(11,1);
                a.digitalWrite(12,1);
                pause(0.1);
                t41=a.digitalRead(3);
                t42=a.digitalRead(6);
                t43=a.digitalRead(7);
                t44=a.digitalRead(10);
                if (t41==1 && t42==1 && t43==1 && t44==1)
                    set(handles.text2,'String','IC is in working condition');
                else
                    set(handles.text2,'String','Faulty IC');
                end
            else
                set(handles.text2,'String','Faulty IC');
            end
        else
            set(handles.text2,'String','Faulty IC');
        end
    else
        set(handles.text2,'String','Faulty IC');
    end
end                

if (n==5)
    a.pinMode(13,'output');
    a.pinMode(2,'output');
    a.pinMode(3,'input');
    a.pinMode(4,'output');
    a.pinMode(5,'output');
    a.pinMode(6,'input');
    a.pinMode(7,'input');
    a.pinMode(8,'output');
    a.pinMode(9,'output');
    a.pinMode(10,'input');
    a.pinMode(11,'output');
    a.pinMode(12,'output');
    a.digitalWrite(13,0);
    a.digitalWrite(2,0);
    a.digitalWrite(4,0);
    a.digitalWrite(5,0);
    a.digitalWrite(8,0);
    a.digitalWrite(9,0);
    a.digitalWrite(11,0);
    a.digitalWrite(12,0);
    pause(0.1);
    t11=a.digitalRead(3);
    t12=a.digitalRead(6);
    t13=a.digitalRead(7);
    t14=a.digitalRead(10);
    if (t11==0 && t12==0 && t13==0 && t14==0)
        a.digitalWrite(13,0);
        a.digitalWrite(2,1);
        a.digitalWrite(4,0);
        a.digitalWrite(5,1);
        a.digitalWrite(8,0);
        a.digitalWrite(9,1);
        a.digitalWrite(11,0);
        a.digitalWrite(12,1);
        pause(0.1);
        t21=a.digitalRead(3);
        t22=a.digitalRead(6);
        t23=a.digitalRead(7);
        t24=a.digitalRead(10);
        if (t21==1 && t22==1 && t23==1 && t24==1)
            a.digitalWrite(13,1);
            a.digitalWrite(2,0);
            a.digitalWrite(4,1);
            a.digitalWrite(5,0);
            a.digitalWrite(8,1);
            a.digitalWrite(9,0);
            a.digitalWrite(11,1);
            a.digitalWrite(12,0);
            pause(0.1);
            t31=a.digitalRead(3);
            t32=a.digitalRead(6);
            t33=a.digitalRead(7);
            t34=a.digitalRead(10);
            if (t31==1 && t32==1 && t33==1 && t34==1)
                a.digitalWrite(13,1);
                a.digitalWrite(2,1);
                a.digitalWrite(4,1);
                a.digitalWrite(5,1);
                a.digitalWrite(8,1);
                a.digitalWrite(9,1);
                a.digitalWrite(11,1);
                a.digitalWrite(12,1);
                pause(0.1);
                t41=a.digitalRead(3);
                t42=a.digitalRead(6);
                t43=a.digitalRead(7);
                t44=a.digitalRead(10);
                if (t41==1 && t42==1 && t43==1 && t44==1)
                    set(handles.text2,'String','IC is in working condition');
                else
                    set(handles.text2,'String','Faulty IC');
                end
            else
                set(handles.text2,'String','Faulty IC');
            end
        else
            set(handles.text2,'String','Faulty IC');
        end
    else
        set(handles.text2,'String','Faulty IC');
    end
end

if (n==6)
    a.pinMode(13,'output');
    a.pinMode(2,'output');
    a.pinMode(3,'input');
    a.pinMode(4,'output');
    a.pinMode(5,'output');
    a.pinMode(6,'input');
    a.pinMode(7,'input');
    a.pinMode(8,'output');
    a.pinMode(9,'output');
    a.pinMode(10,'input');
    a.pinMode(11,'output');
    a.pinMode(12,'output');
    a.digitalWrite(13,0);
    a.digitalWrite(2,0);
    a.digitalWrite(4,0);
    a.digitalWrite(5,0);
    a.digitalWrite(8,0);
    a.digitalWrite(9,0);
    a.digitalWrite(11,0);
    a.digitalWrite(12,0);
    pause(0.1);
    t11=a.digitalRead(3);
    t12=a.digitalRead(6);
    t13=a.digitalRead(7);
    t14=a.digitalRead(10);
    if (t11==0 && t12==0 && t13==0 && t14==0)
        a.digitalWrite(13,0);
        a.digitalWrite(2,1);
        a.digitalWrite(4,0);
        a.digitalWrite(5,1);
        a.digitalWrite(8,0);
        a.digitalWrite(9,1);
        a.digitalWrite(11,0);
        a.digitalWrite(12,1);
        pause(0.1);
        t21=a.digitalRead(3);
        t22=a.digitalRead(6);
        t23=a.digitalRead(7);
        t24=a.digitalRead(10);
        if (t21==1 && t22==1 && t23==1 && t24==1)
            a.digitalWrite(13,1);
            a.digitalWrite(2,0);
            a.digitalWrite(4,1);
            a.digitalWrite(5,0);
            a.digitalWrite(8,1);
            a.digitalWrite(9,0);
            a.digitalWrite(11,1);
            a.digitalWrite(12,0);
            pause(0.1);
            t31=a.digitalRead(3);
            t32=a.digitalRead(6);
            t33=a.digitalRead(7);
            t34=a.digitalRead(10);
            if (t31==1 && t32==1 && t33==1 && t34==1)
                a.digitalWrite(13,1);
                a.digitalWrite(2,1);
                a.digitalWrite(4,1);
                a.digitalWrite(5,1);
                a.digitalWrite(8,1);
                a.digitalWrite(9,1);
                a.digitalWrite(11,1);
                a.digitalWrite(12,1);
                pause(0.1);
                t41=a.digitalRead(3);
                t42=a.digitalRead(6);
                t43=a.digitalRead(7);
                t44=a.digitalRead(10);
                if (t41==0 && t42==0 && t43==0 && t44==0)
                    set(handles.text2,'String','IC is in working condition');
                else
                    set(handles.text2,'String','Faulty IC');
                end
            else
                set(handles.text2,'String','Faulty IC');
            end
        else
            set(handles.text2,'String','Faulty IC');
        end
    else
        set(handles.text2,'String','Faulty IC');
    end
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.text2,'String','Disconnected');
clear all;
