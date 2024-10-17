function varargout = CONTROL(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @CONTROL_OpeningFcn, ...
                   'gui_OutputFcn',  @CONTROL_OutputFcn, ...
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

function CONTROL_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);
clc;
axes(handles.axes1);
imshow('C:\Users\MyPC\Desktop\2311640769_b468ea4974.jpg');
axes(handles.axes2);
imshow('C:\Users\MyPC\Desktop\Logo khoa dien.png');
function varargout = CONTROL_OutputFcn(hObject, eventdata, handles)
varargout{1} = handles.output;
function slider1_Callback(hObject, eventdata, handles)

ModelName = 'ROBOT4';

% a1 = 0;
a2 = 500;
a3 = 420.17;
a4 = 160;

%get the angle
theta1=get(handles.slider1,'value');
set(handles.edit2,'string',num2str(theta1));
theta2=get(handles.slider2,'value');
set(handles.edit3,'string',num2str(theta2));
theta3=get(handles.slider3,'value');
set(handles.edit4,'string',num2str(theta3));
theta4=get(handles.slider4,'value');
set(handles.edit5,'string',num2str(theta4));

%xoay canh tay ben simulink
set_param([ModelName '/Slider Gain1'],'Gain',num2str(theta1));
set_param([ModelName '/Slider Gain2'],'Gain',num2str(theta2));
set_param([ModelName '/Slider Gain3'],'Gain',num2str(theta3));
set_param([ModelName '/Slider Gain4'],'Gain',num2str(theta4));

T1 = [ cosd(theta1) 0   -sind(theta1)    0;
       sind(theta1) 0   -cosd(theta1)    0;
       0            -1       0           486;
       0            0       0            1];

T2 = [ cosd(theta2) -sind(theta2)   0   a2*cosd(theta2);
       sind(theta2) cosd(theta2)    0   a2*sind(theta2);
       0            0               1       0;
       0            0               0        1];
   
T3 = [ cosd(theta3) -sind(theta3)   0   a3*cosd(theta3);
       sind(theta3) cosd(theta3)    0   a3*sind(theta3);
       0            0               1     0;
       0            0               0       1];
   
T4 = [ cosd(theta4) -sind(theta4)   0   a4*cosd(theta4);
       sind(theta4) cosd(theta4)    0   a4*sind(theta4);
       0            0               1   0;
       0            0               0     1];
T = T1*T2*T3*T4;

px=T(1,4);
py=T(2,4);
pz=T(3,4);
set(handles.edit6,'string',num2str(px));
set(handles.edit7,'string',num2str(py));
set(handles.edit8,'string',num2str(pz));

function slider1_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
ModelName = 'ROBOT4';

% a1 = 0;
a2 = 500;
a3 = 420.17;
a4 = 160;

%get the angle
theta1=get(handles.slider1,'value');
set(handles.edit2,'string',num2str(theta1));
theta2=get(handles.slider2,'value');
set(handles.edit3,'string',num2str(theta2));
theta3=get(handles.slider3,'value');
set(handles.edit4,'string',num2str(theta3));
theta4=get(handles.slider4,'value');
set(handles.edit5,'string',num2str(theta4));

%xoay canh tay ben simulink
set_param([ModelName '/Slider Gain1'],'Gain',num2str(theta1));
set_param([ModelName '/Slider Gain2'],'Gain',num2str(theta2));
set_param([ModelName '/Slider Gain3'],'Gain',num2str(theta3));
set_param([ModelName '/Slider Gain4'],'Gain',num2str(theta4));

T1 = [ cosd(theta1) 0   -sind(theta1)    0;
       sind(theta1) 0   -cosd(theta1)    0;
       0            -1       0           486;
       0            0       0            1];

T2 = [ cosd(theta2) -sind(theta2)   0   a2*cosd(theta2);
       sind(theta2) cosd(theta2)    0   a2*sind(theta2);
       0            0               1       0;
       0            0               0        1];
   
T3 = [ cosd(theta3) -sind(theta3)   0   a3*cosd(theta3);
       sind(theta3) cosd(theta3)    0   a3*sind(theta3);
       0            0               1     0;
       0            0               0       1];
   
T4 = [ cosd(theta4) -sind(theta4)   0   a4*cosd(theta4);
       sind(theta4) cosd(theta4)    0   a4*sind(theta4);
       0            0               1   0;
       0            0               0     1];
T = T1*T2*T3*T4;

px=T(1,4);
py=T(2,4);
pz=T(3,4);
set(handles.edit6,'string',num2str(px));
set(handles.edit7,'string',num2str(py));
set(handles.edit8,'string',num2str(pz));
function slider2_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function slider3_Callback(hObject, eventdata, handles)
ModelName = 'ROBOT4';

% a1 = 0;
a2 = 500;
a3 = 420.17;
a4 = 160;

%get the angle
theta1=get(handles.slider1,'value');
set(handles.edit2,'string',num2str(theta1));
theta2=get(handles.slider2,'value');
set(handles.edit3,'string',num2str(theta2));
theta3=get(handles.slider3,'value');
set(handles.edit4,'string',num2str(theta3));
theta4=get(handles.slider4,'value');
set(handles.edit5,'string',num2str(theta4));

%xoay canh tay ben simulink
set_param([ModelName '/Slider Gain1'],'Gain',num2str(theta1));
set_param([ModelName '/Slider Gain2'],'Gain',num2str(theta2));
set_param([ModelName '/Slider Gain3'],'Gain',num2str(theta3));
set_param([ModelName '/Slider Gain4'],'Gain',num2str(theta4));

T1 = [ cosd(theta1) 0   -sind(theta1)    0;
       sind(theta1) 0   -cosd(theta1)    0;
       0            -1       0           486;
       0            0       0            1];

T2 = [ cosd(theta2) -sind(theta2)   0   a2*cosd(theta2);
       sind(theta2) cosd(theta2)    0   a2*sind(theta2);
       0            0               1       0;
       0            0               0        1];
   
T3 = [ cosd(theta3) -sind(theta3)   0   a3*cosd(theta3);
       sind(theta3) cosd(theta3)    0   a3*sind(theta3);
       0            0               1     0;
       0            0               0       1];
   
T4 = [ cosd(theta4) -sind(theta4)   0   a4*cosd(theta4);
       sind(theta4) cosd(theta4)    0   a4*sind(theta4);
       0            0               1   0;
       0            0               0     1];
T = T1*T2*T3*T4;

px=T(1,4);
py=T(2,4);
pz=T(3,4);
set(handles.edit6,'string',num2str(px));
set(handles.edit7,'string',num2str(py));
set(handles.edit8,'string',num2str(pz));
function slider3_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function slider4_Callback(hObject, eventdata, handles)
ModelName = 'ROBOT4';

% a1 = 0;
a2 = 500;
a3 = 420.17;
a4 = 160;

%get the angle
theta1=get(handles.slider1,'value');
set(handles.edit2,'string',num2str(theta1));
theta2=get(handles.slider2,'value');
set(handles.edit3,'string',num2str(theta2));
theta3=get(handles.slider3,'value');
set(handles.edit4,'string',num2str(theta3));
theta4=get(handles.slider4,'value');
set(handles.edit5,'string',num2str(theta4));

%xoay canh tay ben simulink
set_param([ModelName '/Slider Gain1'],'Gain',num2str(theta1));
set_param([ModelName '/Slider Gain2'],'Gain',num2str(theta2));
set_param([ModelName '/Slider Gain3'],'Gain',num2str(theta3));
set_param([ModelName '/Slider Gain4'],'Gain',num2str(theta4));

T1 = [ cosd(theta1) 0   -sind(theta1)    0;
       sind(theta1) 0   -cosd(theta1)    0;
       0            -1       0           486;
       0            0       0            1];

T2 = [ cosd(theta2) -sind(theta2)   0   a2*cosd(theta2);
       sind(theta2) cosd(theta2)    0   a2*sind(theta2);
       0            0               1       0;
       0            0               0        1];
   
T3 = [ cosd(theta3) -sind(theta3)   0   a3*cosd(theta3);
       sind(theta3) cosd(theta3)    0   a3*sind(theta3);
       0            0               1     0;
       0            0               0       1];
   
T4 = [ cosd(theta4) -sind(theta4)   0   a4*cosd(theta4);
       sind(theta4) cosd(theta4)    0   a4*sind(theta4);
       0            0               1   0;
       0            0               0     1];
T = T1*T2*T3*T4;

px=T(1,4);
py=T(2,4);
pz=T(3,4);
set(handles.edit6,'string',num2str(px));
set(handles.edit7,'string',num2str(py));
set(handles.edit8,'string',num2str(pz));
function slider4_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function edit1_Callback(hObject, eventdata, handles)

function edit1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)

function edit2_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)

function edit3_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)

function edit4_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)

function edit5_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)

function edit6_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit7_Callback(hObject, eventdata, handles)

function edit7_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit8_Callback(hObject, eventdata, handles)

function edit8_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function pushbutton2_Callback(hObject, eventdata, handles)
ModelName = 'ROBOT4';
% a1 = 486;
a2 = 500;
a3 = 420.17;
a4 = 160;

theta1 = 0;
theta2 = 0;
theta3 = 0;
theta4 = 0;

%xoay canh tay ben simulink
set_param([ModelName '/Slider Gain1'],'Gain',num2str(theta1));
set_param([ModelName '/Slider Gain2'],'Gain',num2str(theta2));
set_param([ModelName '/Slider Gain3'],'Gain',num2str(theta3));
set_param([ModelName '/Slider Gain4'],'Gain',num2str(theta4));


T1 = [ cosd(theta1) 0   -sind(theta1)    0;
       sind(theta1) 0   -cosd(theta1)    0;
       0            -1       0           486;
       0            0       0            1];

T2 = [ cosd(theta2) -sind(theta2)   0   a2*cosd(theta2);
       sind(theta2) cosd(theta2)    0   a2*sind(theta2);
       0            0               1       0;
       0            0               0        1];
   
T3 = [ cosd(theta3) -sind(theta3)   0   a3*cosd(theta3);
       sind(theta3) cosd(theta3)    0   a3*sind(theta3);
       0            0               1     0;
       0            0               0       1];
   
T4 = [ cosd(theta4) -sind(theta4)   0   a4*cosd(theta4);
       sind(theta4) cosd(theta4)    0   a4*sind(theta4);
       0            0               1   0;
       0            0               0     1];
T = T1*T2*T3*T4;

px=T(1,4);
py=T(2,4);
pz=T(3,4);
set(handles.slider1,'value',theta1);
set(handles.slider2,'value',theta2);
set(handles.slider3,'value',theta3);
set(handles.slider4,'value',theta4);
set(handles.edit2,'string',num2str(0));
set(handles.edit3,'string',num2str(0));
set(handles.edit4,'string',num2str(0));
set(handles.edit5,'string',num2str(0));
set(handles.edit6,'string',num2str(px));
set(handles.edit7,'string',num2str(py));
set(handles.edit8,'string',num2str(pz));
function RUN_Callback(hObject, eventdata, handles)
ModelName = 'ROBOT4';

% Opens the Simulink model 
open_system(ModelName);


set_param(ModelName,'BlockReduction','off');
set_param(ModelName,'StopTime','inf');
set_param(ModelName,'simulationMode','normal');

set_param(ModelName,'StartFcn','1');

set_param(ModelName, 'SimulationCommand', 'start');


function STOP_Callback(hObject, eventdata, handles)
close;
function INVERSE_Callback(hObject, eventdata, handles)
ModelName = 'ROBOT4';
global var;
px=get(handles.slider5,'value');
set(handles.edit9,'string',num2str(px));
py=get(handles.slider6,'value');
set(handles.edit10,'string',num2str(py));
pz=get(handles.slider7,'value');
set(handles.edit11,'string',num2str(pz));
set(handles.edit6,'string',num2str(px));
set(handles.edit7,'string',num2str(py));
set(handles.edit8,'string',num2str(pz));
a1 = 486;
a2 = 500;
a3 = 420.17;
a4 = 160;

theta1=atan2d(py,px);
theta234= 0; 
d=sqrt(px^2+py^2);%DB = OA
xd=d*cosd(theta1);
yd=d*sind(theta1);
r4=d-a4*cosd(theta234);
z4=pz-a4*sind(theta234);%
s=sqrt((z4-a1)^2+r4^2);
theta3=acosd((s^2-a2^2-a3^2)/(2*a2*a3));
beta=atan2d(a3*sind(theta3),a2+a3*cosd(theta3));
alpha=atan2d(z4-a1,r4);
theta2=alpha+beta;
theta4=theta234-theta2-theta3; 
guidata(hObject,handles);


set_param([ModelName '/Slider Gain1'],'Gain',num2str(theta1));
set_param([ModelName '/Slider Gain2'],'Gain',num2str(theta2));
set_param([ModelName '/Slider Gain3'],'Gain',num2str(theta3));
set_param([ModelName '/Slider Gain4'],'Gain',num2str(theta4));
set(handles.edit2,'string',num2str(theta1));

set(handles.edit3,'string',num2str(theta2));

set(handles.edit4,'string',num2str(theta3));

set(handles.edit5,'string',num2str(theta4));

function slider5_Callback(hObject, eventdata, handles)
px=get(handles.slider5,'value');
set(handles.edit9,'string',num2str(px));
function slider5_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function slider6_Callback(hObject, eventdata, handles)
py=get(handles.slider6,'value');
set(handles.edit10,'string',num2str(py));
function slider6_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function slider7_Callback(hObject, eventdata, handles)
pz=get(handles.slider7,'value');
set(handles.edit11,'string',num2str(pz));
function slider7_CreateFcn(hObject, eventdata, handles)

if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function edit9_Callback(hObject, eventdata, handles)

function edit9_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit10_Callback(hObject, eventdata, handles)

function edit10_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit11_Callback(hObject, eventdata, handles)

function edit11_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
