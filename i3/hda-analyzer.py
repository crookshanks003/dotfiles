#!/usr/bin/env python

URL="http://git.alsa-project.org/?p=alsa.git;a=blob_plain;f=hda-analyzer/"
FILES=["hda_analyzer.py", "hda_guilib.py", "hda_codec.py", "hda_proc.py",
       "hda_graph.py", "hda_mixer.py"]

try:
  import gobject
  import gtk
  import pango
except:
  print "Please, install pygtk2 or python-gtk package"

import os
import sys
from urllib import splithost
from httplib import HTTP

if os.path.exists("/dev/shm"):
  TMPDIR="/dev/shm"
else:
  TMPDIR="/tmp"
TMPDIR += "/hda-analyzer"
print "Using temporary directory: %s" % TMPDIR
print "You may remove this directory when finished or if you like to"
print "download the most recent copy of hda-analyzer tool."
if not os.path.exists(TMPDIR):
  os.mkdir(TMPDIR)
for f in FILES:
  dest = TMPDIR + '/' + f
  if os.path.exists(dest):
    print "File cached " + dest
    continue
  print "Downloading file %s" % f
  host, selector = splithost(URL[5:])
  h = HTTP(host)
  h.putrequest('GET', URL + f)
  h.endheaders()
  h.getreply()
  contents = h.getfile().read(2*1024*1024)
  h.close()
  open(dest, "w+").write(contents)
print "Downloaded all files, executing %s" % FILES[0]
os.system("python2 %s" % TMPDIR + '/' + FILES[0] + ' ' + ' '.join(sys.argv[1:]))
