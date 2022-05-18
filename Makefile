########################################################################

# This file is part of the UNAM RATIR/RATTEL software.

# $Id: Makefile.in 3016 2017-12-07 05:25:27Z alan $

########################################################################

# Copyright © 2011 Alan M. Watson <alan@astroscu.unam.mx>
#
# Permission to use, copy, modify, and distribute this software for any
# purpose with or without fee is hereby granted, provided that the above
# copyright notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL
# WARRANTIES WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED
# WARRANTIES OF MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE
# AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL
# DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR
# PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
# TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
# PERFORMANCE OF THIS SOFTWARE.

########################################################################

.SUFFIXES:  .md .html
.md.html			:
	./make-html "$*".md >"$*".html

########################################################################

all			:	index.html \
				acknowledgements.html \
				contact.html \
				search.html \
				news-2022.html \
				news-2021.html \
				news-2020.html \
				news-2019.html \
				news-2018.html \
				news-2017.html \
				publications.html \
				status.html \
				participants.html \
				gallery.html

install			:	all
	rsync -v --chmod=u=rwX,go=rX \
	  ddoti.conf /etc/apache2/sites-enabled/
	rsync -ahv --chmod=u=rwX,go=rX --delete \
	  --exclude=.git/ \
	  --include=*/ \
	  --include=*.html \
	  --include=*.pdf \
	  --include=*.jpg \
	  --include=*.css \
	  --include=*.mp4 \
	  --exclude=* \
	  --exclude=.git* \
	  . /usr/local/var/www/ddoti/html

clean			:
	-rm -f *.html

distclean		:	clean

########################################################################

index.html		:	make-html HEADER.md FOOTER.md index.md
search.html		:	make-html HEADER.md FOOTER.md search.md
contact.html		:	make-html HEADER.md FOOTER.md contact.md
news.html		:	make-html HEADER.md FOOTER.md news.md
status.html		:	make-html HEADER.md FOOTER.md status.md
publications.html	:	make-html HEADER.md FOOTER.md publications.md
gallery.html		:	make-html HEADER.md FOOTER.md gallery.md
