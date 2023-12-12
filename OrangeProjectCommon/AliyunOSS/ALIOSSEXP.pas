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
      const NOT_SET_OSS_ACCESS_ID = 'δ����OSS�����ACCESS ID';
      const NOT_SET_OSS_ACCESS_KEY = 'δ����OSS�����ACCESS KEY';
      const NOT_SET_OSS_ACCESS_ID_AND_ACCESS_KEY = 'û������ACCESS ID & ACCESS KEY';
      const OSS_ACCESS_ID_OR_ACCESS_KEY_EMPTY = 'ACCESS ID��ACCESS KEYΪ��';

      //*************************************************************************************
      //OSS bucket operations
      const OSS_OPTIONS_MUST_BE_ARRAY = '$option����Ϊ����';
      const OSS_GET_BUCKET_LIST_SUCCESS = '��ȡBucket�б�ɹ�!';
      const OSS_GET_BUCKET_LIST_FAILED = '��ȡBucket�б�ʧ��!';
      const OSS_CREATE_BUCKET_SUCCESS = '����Bucket�ɹ�';
      const OSS_CREATE_BUCKET_FAILED = '����Bucketʧ��';
      const OSS_DELETE_BUCKET_SUCCESS = 'ɾ��Bucket�ɹ�';
      const OSS_DELETE_BUCKET_FAILED = 'ɾ��Bucketʧ��';
      const OSS_BUCKET_NAME_INVALID = 'δͨ��Bucket���ƹ���У��';
      const OSS_GET_BUCKET_ACL_SUCCESS = '��ȡBucket ACL�ɹ�';
      const OSS_GET_BUCKET_ACL_FAILED = '��ȡBucket ACLʧ��';
      const OSS_SET_BUCKET_ACL_SUCCESS = '����Bucket ACL�ɹ�';
      const OSS_SET_BUCKET_ACL_FAILED = '����Bucket ACLʧ��';
      const OSS_ACL_INVALID = 'ACL��������Χ,Ŀǰ������(private,public-read,public-read-write����Ȩ��)';
      const OSS_BUCKET_IS_NOT_ALLOWED_EMPTY = 'Bucket������Ϊ��';

      //*************************************************************************************
      //OSS object operations
      const OSS_GET_OBJECT_LIST_SUCCESS = '���OBJECT�б�ɹ�';
      const OSS_GET_OBJECT_LIST_FAILED = '���OBJECT�б�ʧ��';
      const OSS_CREATE_OBJECT_DIR_SUCCESS = '����OBJECTĿ¼�ɹ�';
      const OSS_CREATE_OBJECT_DIR_FAILED = '����OBJECTĿ¼ʧ��';
      const OSS_DELETE_OBJECT_SUCCESS = 'ɾ��OBJECT�ɹ�';
      const OSS_DELETE_OBJECT_FAILED = 'ɾ��OBJECTʧ��';
      const OSS_UPLOAD_FILE_BY_CONTENT_SUCCESS = 'ͨ��Http Body�ϴ��ļ��ɹ�';
      const OSS_UPLOAD_FILE_BY_CONTENT_FAILED = 'ͨ��Http Body�ϴ��ļ�ʧ��';
      const OSS_GET_OBJECT_META_SUCCESS = '���OBJECT META�ɹ�';
      const OSS_GET_OBJECT_META_FAILED = '���OBJECT METAʧ��';
      const OSS_OBJECT_NAME_INVALID = 'δͨ��Object���ƹ���У��';
      const OSS_OBJECT_IS_NOT_ALLOWED_EMPTY = 'Object������Ϊ��';
      const OSS_INVALID_HTTP_BODY_CONTENT = 'Http Body�����ݷǷ�';
      const OSS_GET_OBJECT_SUCCESS = '���Object�ɹ�';
      const OSS_GET_OBJECT_FAILED = '���Objectʧ��';
      const OSS_OBJECT_EXIST = 'Object����';
      const OSS_OBJECT_NOT_EXIST = 'Object������';
      const OSS_NOT_SET_HTTP_CONTENT = 'Ϊ����Http Body';
      const OSS_INVALID_CONTENT_LENGTH = '�Ƿ���Content-Lengthֵ';
      const OSS_CONTENT_LENGTH_MUST_MORE_THAN_ZERO = 'Content-Length�������0';
      const OSS_UPLOAD_FILE_NOT_EXIST = '�ϴ��ļ�������';
      const OSS_COPY_OBJECT_SUCCESS = '����Object�ɹ�';
      const OSS_COPY_OBJECT_FAILED = '����Objectʧ��';
      const OSS_FILE_NOT_EXIST = '�ļ�������';
      const OSS_FILE_PATH_IS_NOT_ALLOWED_EMPTY = '�ϴ��ļ�·��Ϊ��';

      //*************************************************************************************
      //OSS object Group operations
      const OSS_CREATE_OBJECT_GROUP_SUCCESS = '����Object Group�ɹ�';
      const OSS_CREATE_OBJECT_GROUP_FAILED = '����Object Groupʧ��';
      const OSS_GET_OBJECT_GROUP_SUCCESS = '��ȡObject Group�ɹ�';
      const OSS_GET_OBJECT_GROUP_FAILED = '��ȡObject Groupʧ��';
      const OSS_GET_OBJECT_GROUP_INDEX_SUCCESS = '��ȡObject Group Index�ɹ�';
      const OSS_GET_OBJECT_GROUP_INDEX_FAILED = '��ȡObject Group Indexʧ��';
      const OSS_GET_OBJECT_GROUP_META_SUCCESS = '��ȡObject Group Group Meta�ɹ�';
      const OSS_GET_OBJECT_GROUP_META_FAILED = '��ȡObject Group Group Metaʧ��';
      const OSS_DELETE_OBJECT_GROUP_SUCCESS = 'ɾ��Object Group Group�ɹ�';
      const OSS_DELETE_OBJECT_GROUP_FAILED = 'ɾ��Object Group Groupʧ��';
      const OSS_OBJECT_GROUP_IS_NOT_ALLOWED_EMPTY = 'Object Group������Ϊ��';
      const OSS_OBJECT_ARRAY_IS_EMPTY = '����Object Group��Object������Ϊ��';
      const OSS_OBJECT_GROUP_TOO_MANY_OBJECT = 'ÿ��Object Group������1000��Object';

      //*************************************************************************************
      //OSS Multi-Part Upload
      const OSS_INITIATE_MULTI_PART_SUCCESS = '��ʼ��Multi-Part Upload�ɹ�';
      const OSS_INITIATE_MULTI_PART_FAILED = '��ʼ��Multi-Part Uploadʧ��';

      //*************************************************************************************
      //misc
      const OSS_INVALID_OPTION_HEADERS = 'OPTIONS��������';
      const OSS_INVALID_DIRECTORY = 'Ŀ¼������';
  end;

  procedure IsEmpty(const name: string; const error: string);

implementation

procedure IsEmpty(const name: string; const error: string);
begin
  if name = '' then
    raise EAliOssException.Create(error);
end;

end.
