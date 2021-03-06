function varargout = interfazAproximacionCuadratica(varargin)
% INTERFAZAPROXIMACIONCUADRATICA MATLAB code for interfazAproximacionCuadratica.fig
%      INTERFAZAPROXIMACIONCUADRATICA, by itself, creates a new INTERFAZAPROXIMACIONCUADRATICA or raises the existing
%      singleton*.
%
%      H = INTERFAZAPROXIMACIONCUADRATICA returns the handle to a new INTERFAZAPROXIMACIONCUADRATICA or the handle to
%      the existing singleton*.
%
%      INTERFAZAPROXIMACIONCUADRATICA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INTERFAZAPROXIMACIONCUADRATICA.M with the given input arguments.
%
%      INTERFAZAPROXIMACIONCUADRATICA('Property','Value',...) creates a new INTERFAZAPROXIMACIONCUADRATICA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before interfazAproximacionCuadratica_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to interfazAproximacionCuadratica_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help interfazAproximacionCuadratica

% Last Modified by GUIDE v2.5 09-Nov-2017 20:49:43

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @interfazAproximacionCuadratica_OpeningFcn, ...
                   'gui_OutputFcn',  @interfazAproximacionCuadratica_OutputFcn, ...
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


% --- Executes just before interfazAproximacionCuadratica is made visible.
function interfazAproximacionCuadratica_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to interfazAproximacionCuadratica (see VARARGIN)

handles.tabla=varargin{1};

% Choose default command line output for interfazAproximacionCuadratica
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes interfazAproximacionCuadratica wait for user response (see UIRESUME)
% uiwait(handles.figure1);

set(handles.uitable1, 'Data', OptimizarParaTabla(tablaCuadratica(handles.tabla.matriz'),handles.tabla.decimales));
sumatoria = sumatoriaCuadratica(handles.tabla.matriz');
set(handles.uitable2, 'Data', OptimizarParaTabla(sumatoria(2:10),handles.tabla.decimales));
set(handles.uitable2, 'RowName', {'S'});
set(handles.uitable3, 'Data', OptimizarParaTabla(ecuacionesCuadraticas(handles.tabla.matriz'),handles.tabla.decimales));
axes(handles.axes2);
zoom on;
[a , b, c] = aproximacionCuadratica(handles.tabla.matriz');
graficarAproximacionCuadratica(a, b, c, handles.tabla.matriz',handles.tabla.decimales);
uicontrol(handles.pushbutton1);


% --- Outputs from this function are returned to the command line.
function varargout = interfazAproximacionCuadratica_OutputFcn(hObject, eventdata, handles) 
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
close;
interfazAproximacionSeleccion(handles.tabla);


% --- Executes during object creation, after setting all properties.
function uitable1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uitable1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function uitable2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uitable2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function uitable3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uitable3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function axes2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes2
title('', 'interpreter', 'latex');
xlabel('', 'interpreter', 'latex');


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
movegui('center');

% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: delete(hObject) closes the figure
delete(hObject);
interfazAproximacionSeleccion(handles.tabla);


% --- Executes during object creation, after setting all properties.
function uipanel2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uipanel2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


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
