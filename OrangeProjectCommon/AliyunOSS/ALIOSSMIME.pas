unit ALIOSSMIME;

{
  OSS (Open Storage Services) Delphi SDK v1.0.0 - MIME Types

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

function GetMimeType(ext:string): string;

implementation

uses IniFiles, SysUtils;

var mime_types: THashedStringList;

function GetMimeType(ext:string): string;
var
  ret: string;
begin
  ret := mime_types.Values[lowercase(ext)];
  if ret = '' then
    result := mime_types.Values['']
  else
    result := ret;
end;

initialization
  //initialize hashmap
  mime_types := THashedStringList.Create;

  mime_types.Values['apk'] := 'application/vnd.android.package-archive';
  mime_types.Values['3gp'] := 'video/3gpp';
  mime_types.Values['ai'] := 'application/postscript';
  mime_types.Values['aif'] := 'audio/x-aiff';
  mime_types.Values['aifc'] := 'audio/x-aiff';
  mime_types.Values['aiff'] := 'audio/x-aiff';
  mime_types.Values['asc'] := 'text/plain';
  mime_types.Values['atom'] := 'application/atom+xml';
  mime_types.Values['au'] := 'audio/basic';
  mime_types.Values['avi'] := 'video/x-msvideo';
  mime_types.Values['bcpio'] := 'application/x-bcpio';
  mime_types.Values['bin'] := 'application/octet-stream';
  mime_types.Values['bmp'] := 'image/bmp';
  mime_types.Values['cdf'] := 'application/x-netcdf';
  mime_types.Values['cgm'] := 'image/cgm';
  mime_types.Values['class'] := 'application/octet-stream';
  mime_types.Values['cpio'] := 'application/x-cpio';
  mime_types.Values['cpt'] := 'application/mac-compactpro';
  mime_types.Values['csh'] := 'application/x-csh';
  mime_types.Values['css'] := 'text/css';
  mime_types.Values['dcr'] := 'application/x-director';
  mime_types.Values['dif'] := 'video/x-dv';
  mime_types.Values['dir'] := 'application/x-director';
  mime_types.Values['djv'] := 'image/vnd.djvu';
  mime_types.Values['djvu'] := 'image/vnd.djvu';
  mime_types.Values['dll'] := 'application/octet-stream';
  mime_types.Values['dmg'] := 'application/octet-stream';
  mime_types.Values['dms'] := 'application/octet-stream';
  mime_types.Values['doc'] := 'application/msword';
  mime_types.Values['dtd'] := 'application/xml-dtd';
  mime_types.Values['dv'] := 'video/x-dv';
  mime_types.Values['dvi'] := 'application/x-dvi';
  mime_types.Values['dxr'] := 'application/x-director';
  mime_types.Values['eps'] := 'application/postscript';
  mime_types.Values['etx'] := 'text/x-setext';
  mime_types.Values['exe'] := 'application/octet-stream';
  mime_types.Values['ez'] := 'application/andrew-inset';
  mime_types.Values['flv'] := 'video/x-flv';
  mime_types.Values['gif'] := 'image/gif';
  mime_types.Values['gram'] := 'application/srgs';
  mime_types.Values['grxml'] := 'application/srgs+xml';
  mime_types.Values['gtar'] := 'application/x-gtar';
  mime_types.Values['gz'] := 'application/x-gzip';
  mime_types.Values['hdf'] := 'application/x-hdf';
  mime_types.Values['hqx'] := 'application/mac-binhex40';
  mime_types.Values['htm'] := 'text/html';
  mime_types.Values['html'] := 'text/html';
  mime_types.Values['ice'] := 'x-conference/x-cooltalk';
  mime_types.Values['ico'] := 'image/x-icon';
  mime_types.Values['ics'] := 'text/calendar';
  mime_types.Values['ief'] := 'image/ief';
  mime_types.Values['ifb'] := 'text/calendar';
  mime_types.Values['iges'] := 'model/iges';
  mime_types.Values['igs'] := 'model/iges';
  mime_types.Values['jnlp'] := 'application/x-java-jnlp-file';
  mime_types.Values['jp2'] := 'image/jp2';
  mime_types.Values['jpe'] := 'image/jpeg';
  mime_types.Values['jpeg'] := 'image/jpeg';
  mime_types.Values['jpg'] := 'image/jpeg';
  mime_types.Values['js'] := 'application/x-javascript';
  mime_types.Values['kar'] := 'audio/midi';
  mime_types.Values['latex'] := 'application/x-latex';
  mime_types.Values['lha'] := 'application/octet-stream';
  mime_types.Values['lzh'] := 'application/octet-stream';
  mime_types.Values['m3u'] := 'audio/x-mpegurl';
  mime_types.Values['m4a'] := 'audio/mp4a-latm';
  mime_types.Values['m4p'] := 'audio/mp4a-latm';
  mime_types.Values['m4u'] := 'video/vnd.mpegurl';
  mime_types.Values['m4v'] := 'video/x-m4v';
  mime_types.Values['mac'] := 'image/x-macpaint';
  mime_types.Values['man'] := 'application/x-troff-man';
  mime_types.Values['mathml'] := 'application/mathml+xml';
  mime_types.Values['me'] := 'application/x-troff-me';
  mime_types.Values['mesh'] := 'model/mesh';
  mime_types.Values['mid'] := 'audio/midi';
  mime_types.Values['midi'] := 'audio/midi';
  mime_types.Values['mif'] := 'application/vnd.mif';
  mime_types.Values['mov'] := 'video/quicktime';
  mime_types.Values['movie'] := 'video/x-sgi-movie';
  mime_types.Values['mp2'] := 'audio/mpeg';
  mime_types.Values['mp3'] := 'audio/mpeg';
  mime_types.Values['mp4'] := 'video/mp4';
  mime_types.Values['mpe'] := 'video/mpeg';
  mime_types.Values['mpeg'] := 'video/mpeg';
  mime_types.Values['mpg'] := 'video/mpeg';
  mime_types.Values['mpga'] := 'audio/mpeg';
  mime_types.Values['ms'] := 'application/x-troff-ms';
  mime_types.Values['msh'] := 'model/mesh';
  mime_types.Values['mxu'] := 'video/vnd.mpegurl';
  mime_types.Values['nc'] := 'application/x-netcdf';
  mime_types.Values['oda'] := 'application/oda';
  mime_types.Values['ogg'] := 'application/ogg';
  mime_types.Values['ogv'] := 'video/ogv';
  mime_types.Values['pbm'] := 'image/x-portable-bitmap';
  mime_types.Values['pct'] := 'image/pict';
  mime_types.Values['pdb'] := 'chemical/x-pdb';
  mime_types.Values['pdf'] := 'application/pdf';
  mime_types.Values['pgm'] := 'image/x-portable-graymap';
  mime_types.Values['pgn'] := 'application/x-chess-pgn';
  mime_types.Values['pic'] := 'image/pict';
  mime_types.Values['pict'] := 'image/pict';
  mime_types.Values['png'] := 'image/png';
  mime_types.Values['pnm'] := 'image/x-portable-anymap';
  mime_types.Values['pnt'] := 'image/x-macpaint';
  mime_types.Values['pntg'] := 'image/x-macpaint';
  mime_types.Values['ppm'] := 'image/x-portable-pixmap';
  mime_types.Values['ppt'] := 'application/vnd.ms-powerpoint';
  mime_types.Values['ps'] := 'application/postscript';
  mime_types.Values['qt'] := 'video/quicktime';
  mime_types.Values['qti'] := 'image/x-quicktime';
  mime_types.Values['qtif'] := 'image/x-quicktime';
  mime_types.Values['ra'] := 'audio/x-pn-realaudio';
  mime_types.Values['ram'] := 'audio/x-pn-realaudio';
  mime_types.Values['ras'] := 'image/x-cmu-raster';
  mime_types.Values['rdf'] := 'application/rdf+xml';
  mime_types.Values['rgb'] := 'image/x-rgb';
  mime_types.Values['rm'] := 'application/vnd.rn-realmedia';
  mime_types.Values['roff'] := 'application/x-troff';
  mime_types.Values['rtf'] := 'text/rtf';
  mime_types.Values['rtx'] := 'text/richtext';
  mime_types.Values['sgm'] := 'text/sgml';
  mime_types.Values['sgml'] := 'text/sgml';
  mime_types.Values['sh'] := 'application/x-sh';
  mime_types.Values['shar'] := 'application/x-shar';
  mime_types.Values['silo'] := 'model/mesh';
  mime_types.Values['sit'] := 'application/x-stuffit';
  mime_types.Values['skd'] := 'application/x-koan';
  mime_types.Values['skm'] := 'application/x-koan';
  mime_types.Values['skp'] := 'application/x-koan';
  mime_types.Values['skt'] := 'application/x-koan';
  mime_types.Values['smi'] := 'application/smil';
  mime_types.Values['smil'] := 'application/smil';
  mime_types.Values['snd'] := 'audio/basic';
  mime_types.Values['so'] := 'application/octet-stream';
  mime_types.Values['spl'] := 'application/x-futuresplash';
  mime_types.Values['src'] := 'application/x-wais-source';
  mime_types.Values['sv4cpio'] := 'application/x-sv4cpio';
  mime_types.Values['sv4crc'] := 'application/x-sv4crc';
  mime_types.Values['svg'] := 'image/svg+xml';
  mime_types.Values['swf'] := 'application/x-shockwave-flash';
  mime_types.Values['t'] := 'application/x-troff';
  mime_types.Values['tar'] := 'application/x-tar';
  mime_types.Values['tcl'] := 'application/x-tcl';
  mime_types.Values['tex'] := 'application/x-tex';
  mime_types.Values['texi'] := 'application/x-texinfo';
  mime_types.Values['texinfo'] := 'application/x-texinfo';
  mime_types.Values['tif'] := 'image/tiff';
  mime_types.Values['tiff'] := 'image/tiff';
  mime_types.Values['tr'] := 'application/x-troff';
  mime_types.Values['tsv'] := 'text/tab-separated-values';
  mime_types.Values['txt'] := 'text/plain';
  mime_types.Values['ustar'] := 'application/x-ustar';
  mime_types.Values['vcd'] := 'application/x-cdlink';
  mime_types.Values['vrml'] := 'model/vrml';
  mime_types.Values['vxml'] := 'application/voicexml+xml';
  mime_types.Values['wav'] := 'audio/x-wav';
  mime_types.Values['wbmp'] := 'image/vnd.wap.wbmp';
  mime_types.Values['wbxml'] := 'application/vnd.wap.wbxml';
  mime_types.Values['webm'] := 'video/webm';
  mime_types.Values['wml'] := 'text/vnd.wap.wml';
  mime_types.Values['wmlc'] := 'application/vnd.wap.wmlc';
  mime_types.Values['wmls'] := 'text/vnd.wap.wmlscript';
  mime_types.Values['wmlsc'] := 'application/vnd.wap.wmlscriptc';
  mime_types.Values['wmv'] := 'video/x-ms-wmv';
  mime_types.Values['wrl'] := 'model/vrml';
  mime_types.Values['xbm'] := 'image/x-xbitmap';
  mime_types.Values['xht'] := 'application/xhtml+xml';
  mime_types.Values['xhtml'] := 'application/xhtml+xml';
  mime_types.Values['xls'] := 'application/vnd.ms-excel';
  mime_types.Values['xml'] := 'application/xml';
  mime_types.Values['xpm'] := 'image/x-xpixmap';
  mime_types.Values['xsl'] := 'application/xml';
  mime_types.Values['xslt'] := 'application/xslt+xml';
  mime_types.Values['xul'] := 'application/vnd.mozilla.xul+xml';
  mime_types.Values['xwd'] := 'image/x-xwindowdump';
  mime_types.Values['xyz'] := 'chemical/x-xyz';
  mime_types.Values['zip'] := 'application/zip';

  mime_types.Values[''] := 'application/octet-stream'; //new

finalization
  mime_types.Destroy;

end.
