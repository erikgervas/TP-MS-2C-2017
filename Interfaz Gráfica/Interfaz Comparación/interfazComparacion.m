function varargout = interfazComparacion(varargin)
% INTERFAZCOMPARACION MATLAB code for interfazComparacion.fig
%      INTERFAZCOMPARACION, by itself, creates a new INTERFAZCOMPARACION or raises the existing
%      singleton*.
%
%      H = INTERFAZCOMPARACION returns the handle to a new INTERFAZCOMPARACION or the handle to
%      the existing singleton*.
%
%      INTERFAZCOMPARACION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INTERFAZCOMPARACION.M with the given input arguments.
%
%      INTERFAZCOMPARACION('Property','Value',...) creates a new INTERFAZCOMPARACION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before interfazComparacion_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to interfazComparacion_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help interfazComparacion

% Last Modified by GUIDE v2.5 09-Nov-2017 21:05:02

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @interfazComparacion_OpeningFcn, ...
                   'gui_OutputFcn',  @interfazComparacion_OutputFcn, ...
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


% --- Executes just before interfazComparacion is made visible.
function interfazComparacion_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to interfazComparacion (see VARARGIN)

handles.tabla=varargin{1};

% Choose default command line output for interfazComparacion
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes interfazComparacion wait for user response (see UIRESUME)
% uiwait(handles.figure1);

[tabla, resultados] = dameLaTabla(handles.tabla.matriz');

set(handles.uitable1, 'Data', OptimizarParaTabla(tabla,handles.tabla.decimales));

set(handles.uitable3, 'Data', OptimizarParaTabla(resultados,handles.tabla.decimales));

[valor, indice] = obtenerMejorAproximacion(handles.tabla.matriz');

axes(handles.axes1);

zoom on;

switch indice
    case 1
        set(handles.text7, 'String', 'Aproximación lineal');
        [m , b] = aproximacionLineal(handles.tabla.matriz');
        graficarAproximacionLineal(m, b, handles.tabla.matriz', handles.tabla.decimales);
    case 2
        set(handles.text7, 'String', 'Aproximación parabólica');
        [a , b, c] = aproximacionCuadratica(handles.tabla.matriz');
        graficarAproximacionCuadratica(a, b, c, handles.tabla.matriz', handles.tabla.decimales);
    case 3
        set(handles.text7, 'String', 'Aproximación exponencial');
        [a , b] = aproximacionExponencial(handles.tabla.matriz');
        graficarAproximacionExponencial(a, b, handles.tabla.matriz', handles.tabla.decimales);
    case 4
        set(handles.text7, 'String', 'Aproximación potencial');
        [a , b] = aproximacionPotencial(handles.tabla.matriz');
        graficarAproximacionPotencial(a, b, handles.tabla.matriz', handles.tabla.decimales);
    case 5
        set(handles.text7, 'String', 'Aproximación hiperbólica');
        [a , b] = aproximacionHiperbolica(handles.tabla.matriz');
        graficarAproximacionHiperbolica(a, b, handles.tabla.matriz', handles.tabla.decimales);
    otherwise
        set(handles.text7, 'String', 'Indeterminado');
end

uicontrol(handles.pushbutton1);

% --- Outputs from this function are returned to the command line.
function varargout = interfazComparacion_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close all;
wInterfazPrincipal(handles.tabla);

% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
movegui('center');

% --- Executes during object creation, after setting all properties.
function uitable1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uitable1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% --- Executes during object creation, after setting all properties.
function uitable3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uitable3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% --- Executes during object creation, after setting all properties.
function text7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
   
% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
title('', 'interpreter', 'latex');
xlabel('', 'interpreter', 'latex');


% --- Executes on key press with focus on pushbutton1 and none of its controls.
function pushbutton1_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
key = eventdata.Key;
if(strcmp (key , 'return'))
    pushbutton1_Callback(hObject, eventdata, handles);
end
