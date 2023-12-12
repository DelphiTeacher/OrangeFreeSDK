unit ALIOSSEXP;

{
  OSS (Open Storage Services) Delphi SDK v1.0.0 - Exceptions

  The MIT License (MIT)
  Copyright (c) 2012 Guangzhou Cloudstrust Software Development Co., Ltd
  http://cloudstrust.com/

  Permission is hereby granted, free of charge, to any person obtaining
  a copy of this software and associated documentation files (the
  "Software"), to deal in the Software without restriction, including
  without limitation the rights to use, copy, modify, merge, publish,
  distribute, sublicense, and/or sell copies of the Software, and to
  permit persons to whom the Software is furnished to do so, subject to
  the following conditions:

  The above copyright notice and this permission notice shall be
  included in all copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
  MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
  LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
  OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
  WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
}

interface

uses SysUtils;

type
  EAliOssException = class(Exception)
    public
      //*************************************************************************************
      //access id & access key
      const NOT_SET_OSS_ACCESS_ID = '未设置OSS服务的ACCESS ID';
      const NOT_SET_OSS_ACCESS_KEY = '未设置OSS服务的ACCESS KEY';
      const NOT_SET_OSS_ACCESS_ID_AND_ACCESS_KEY = '没有设置ACCESS ID & ACCESS KEY';
      const OSS_ACCESS_ID_OR_ACCESS_KEY_EMPTY = 'ACCESS ID或ACCESS KEY为空';

      //*************************************************************************************
      //OSS bucket operations
      const OSS_OPTIONS_MUST_BE_ARRAY = '$option必须为数组';
      const OSS_GET_BUCKET_LIST_SUCCESS = '获取Bucket列表成功!';
      const OSS_GET_BUCKET_LIST_FAILED = '获取Bucket列表失败!';
      const OSS_CREATE_BUCKET_SUCCESS = '创建Bucket成功';
      const OSS_CREATE_BUCKET_FAILED = '创建Bucket失败';
      const OSS_DELETE_BUCKET_SUCCESS = '删除Bucket成功';
      const OSS_DELETE_BUCKET_FAILED = '删除Bucket失败';
      const OSS_BUCKET_NAME_INVALID = '未通过Bucket名称规则校验';
      const OSS_GET_BUCKET_ACL_SUCCESS = '获取Bucket ACL成功';
      const OSS_GET_BUCKET_ACL_FAILED = '获取Bucket ACL失败';
      const OSS_SET_BUCKET_ACL_SUCCESS = '设置Bucket ACL成功';
      const OSS_SET_BUCKET_ACL_FAILED = '设置Bucket ACL失败';
      const OSS_ACL_INVALID = 'ACL不在允许范围,目前仅允许(private,public-read,public-read-write三种权限)';
      const OSS_BUCKET_IS_NOT_ALLOWED_EMPTY = 'Bucket不允许为空';

      //*************************************************************************************
      //OSS object operations
      const OSS_GET_OBJECT_LIST_SUCCESS = '获得OBJECT列表成功';
      const OSS_GET_OBJECT_LIST_FAILED = '获得OBJECT列表失败';
      const OSS_CREATE_OBJECT_DIR_SUCCESS = '创建OBJECT目录成功';
      const OSS_CREATE_OBJECT_DIR_FAILED = '创建OBJECT目录失败';
      const OSS_DELETE_OBJECT_SUCCESS = '删除OBJECT成功';
      const OSS_DELETE_OBJECT_FAILED = '删除OBJECT失败';
      const OSS_UPLOAD_FILE_BY_CONTENT_SUCCESS = '通过Http Body上传文件成功';
      const OSS_UPLOAD_FILE_BY_CONTENT_FAILED = '通过Http Body上传文件失败';
      const OSS_GET_OBJECT_META_SUCCESS = '获得OBJECT META成功';
      const OSS_GET_OBJECT_META_FAILED = '获得OBJECT META失败';
      const OSS_OBJECT_NAME_INVALID = '未通过Object名称规则校验';
      const OSS_OBJECT_IS_NOT_ALLOWED_EMPTY = 'Object不允许为空';
      const OSS_INVALID_HTTP_BODY_CONTENT = 'Http Body的内容非法';
      const OSS_GET_OBJECT_SUCCESS = '获得Object成功';
      const OSS_GET_OBJECT_FAILED = '获得Object失败';
      const OSS_OBJECT_EXIST = 'Object存在';
      const OSS_OBJECT_NOT_EXIST = 'Object不存在';
      const OSS_NOT_SET_HTTP_CONTENT = '为设置Http Body';
      const OSS_INVALID_CONTENT_LENGTH = '非法的Content-Length值';
      const OSS_CONTENT_LENGTH_MUST_MORE_THAN_ZERO = 'Content-Length必须大于0';
      const OSS_UPLOAD_FILE_NOT_EXIST = '上传文件不存在';
      const OSS_COPY_OBJECT_SUCCESS = '拷贝Object成功';
      const OSS_COPY_OBJECT_FAILED = '拷贝Object失败';
      const OSS_FILE_NOT_EXIST = '文件不存在';
      const OSS_FILE_PATH_IS_NOT_ALLOWED_EMPTY = '上传文件路径为空';

      //*************************************************************************************
      //OSS object Group operations
      const OSS_CREATE_OBJECT_GROUP_SUCCESS = '创建Object Group成功';
      const OSS_CREATE_OBJECT_GROUP_FAILED = '创建Object Group失败';
      const OSS_GET_OBJECT_GROUP_SUCCESS = '获取Object Group成功';
      const OSS_GET_OBJECT_GROUP_FAILED = '获取Object Group失败';
      const OSS_GET_OBJECT_GROUP_INDEX_SUCCESS = '获取Object Group Index成功';
      const OSS_GET_OBJECT_GROUP_INDEX_FAILED = '获取Object Group Index失败';
      const OSS_GET_OBJECT_GROUP_META_SUCCESS = '获取Object Group Group Meta成功';
      const OSS_GET_OBJECT_GROUP_META_FAILED = '获取Object Group Group Meta失败';
      const OSS_DELETE_OBJECT_GROUP_SUCCESS = '删除Object Group Group成功';
      const OSS_DELETE_OBJECT_GROUP_FAILED = '删除Object Group Group失败';
      const OSS_OBJECT_GROUP_IS_NOT_ALLOWED_EMPTY = 'Object Group不允许为空';
      const OSS_OBJECT_ARRAY_IS_EMPTY = '创建Object Group的Object不允许为空';
      const OSS_OBJECT_GROUP_TOO_MANY_OBJECT = '每个Object Group最多包含1000个Object';

      //*************************************************************************************
      //OSS Multi-Part Upload
      const OSS_INITIATE_MULTI_PART_SUCCESS = '初始化Multi-Part Upload成功';
      const OSS_INITIATE_MULTI_PART_FAILED = '初始化Multi-Part Upload失败';

      //*************************************************************************************
      //misc
      const OSS_INVALID_OPTION_HEADERS = 'OPTIONS不是数组';
      const OSS_INVALID_DIRECTORY = '目录不存在';
  end;

  procedure IsEmpty(const name: string; const error: string);

implementation

procedure IsEmpty(const name: string; const error: string);
begin
  if name = '' then
    raise EAliOssException.Create(error);
end;

end.
