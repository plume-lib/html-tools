all: python-style test

PYTHON_FILES=../hevea-add-verbatim-linenos
python-style:
	yapf -i --style='{column_limit: 100}' ${PYTHON_FILES}
	pylint -f parseable --disable=W,line-too-long,invalid-name ${PYTHON_FILES}

test:
# html-update-link-dates-test is not automated.
# I could use libfaketime; see
# https://www.linux.com/news/changing-what-time-process-thinks-it-libfaketime
#	${MAKE} -C html-update-link-dates-test
