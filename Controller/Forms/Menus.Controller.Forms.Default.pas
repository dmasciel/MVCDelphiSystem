unit Menus.Controller.Forms.Default;

interface

type
  TControllerFormsDefault = class
    class procedure CreateForm(ClassName: String);
  end;

implementation

uses
  System.SysUtils,
  FMX.Types,
  System.Classes,
  FMX.Forms;

{ TControllerFormsDefault }

class procedure TControllerFormsDefault.CreateForm(ClassName: String);
var
  ObjFMX: TFMXObjectClass;
  newForm: TCustomForm;
begin
  ObjFMX := TFMXObjectClass(GetClass(ClassName));
  try
    newForm := (ObjFMX.Create(nil) as TCustomForm);
    try
        newForm.Position := TFormPosition.ScreenCenter;
        newForm.ShowModal;
    finally
        newForm.free;
    end;
  except
      raise Exception.Create('Objeto não existe');
  end;
end;

end.
