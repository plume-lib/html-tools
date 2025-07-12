all: python-style test

PYTHON_FILES:=../hevea-add-verbatim-linenos
python-style:
	ruff format ${PYTHON_FILES}
	ruff check ${PYTHON_FILES} --fix

test:
# html-update-link-dates-test is not automated.
# I could use libfaketime; see
# https://www.linux.com/news/changing-what-time-process-thinks-it-libfaketime
#	${MAKE} -C html-update-link-dates-test
