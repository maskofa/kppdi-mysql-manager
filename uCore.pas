unit uCore;

interface

uses
  FMX.TabControl, FMX.Graphics, System.Types, FMX.Types, System.Classes,
  System.UITypes, FMX.Controls;

type
  TTabItem = class(FMX.TabControl.TTabItem)
    private
      FOnClose: TNotifyEvent;
      procedure DrawCloseIcon;
    protected
      procedure Paint; override;
      procedure MouseDown(Button: TMouseButton; Shift: TShiftState;
                X: Single; Y: Single); override;
      //procedure DoEnter; override;
    public
      constructor Create(AOwner: TComponent); override;
      property OnClose: TNotifyEvent read FOnClose write FOnClose;
  end;

implementation
{
procedure TTabItem.DoEnter;
begin
  inherited DoEnter;
  DrawCloseIcon;

  if Assigned(OnEnter) then
  OnEnter(Self);
end;
}
procedure TTabItem.DrawCloseIcon;
begin
  Canvas.Stroke.Kind      := TBrushKind.Solid;
  Canvas.Stroke.Thickness := 0.5;
  Canvas.Stroke.Color     := TAlphaColorRec.Red;
  Canvas.DrawLine(PointF( 5,  8), PointF(15,  8), 255);
  Canvas.DrawLine(PointF(15,  8), PointF(15, 22), 255);
  Canvas.DrawLine(PointF(15, 22), PointF( 5, 22), 255);
  Canvas.DrawLine(PointF( 5, 22), PointF( 5,  8), 255);
  Canvas.DrawLine(PointF( 7, 10), PointF(13, 20), 255);
  Canvas.DrawLine(PointF( 7, 20), PointF(13, 10), 255);
end;

procedure TTabItem.MouseDown(Button: TMouseButton; Shift: TShiftState;
          X: Single; Y: Single);
begin
  inherited MouseDown(Button, Shift, X, Y);

  if (X >= 5) and (X <= 15) and (Y >= 8) and (Y <= 22) then
  if Assigned(OnClose) then OnClose(Self);

  if Assigned(OnMouseDown) then
  OnMouseDown(Self, Button, Shift, X, Y);
end;

constructor TTabItem.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;


procedure TTabItem.Paint;
begin
  if Tag = 0 then
  begin
    Text := '   ' + Text;
    Tag  := 1;
  end;

  DrawCloseIcon;
end;


end.
