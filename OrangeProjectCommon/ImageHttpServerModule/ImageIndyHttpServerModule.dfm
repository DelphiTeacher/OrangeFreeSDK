object dmImageIndyHttpServer: TdmImageIndyHttpServer
  OldCreateOrder = False
  Height = 294
  Width = 371
  object IdImageHTTPServer: TIdHTTPServer
    Bindings = <>
    DefaultPort = 7030
    OnDoneWithPostStream = IdImageHTTPServerDoneWithPostStream
    OnCommandGet = IdImageHTTPServerCommandGet
    Left = 168
    Top = 96
  end
end
