style-fix: perl-style-fix python-style-fix shell-style-fix
style-check: perl-style-check python-style-check python-typecheck shell-style-check

PERL_FILES   := $(shell grep -r -l --exclude='*~' --exclude='*.tar' --exclude='*.tdy' --exclude=gradlew --exclude-dir=.git '^\#! \?\(/bin/\|/usr/bin/env \)perl'   | grep -v addrfilter | grep -v cronic-orig | grep -v mail-stackoverflow.sh)
perl-style-fix: install-ruff
	rm -rf *.tdy
	perltidy -gnu ${PERL_FILES}
perl-style-check: install-ruff
	rm -rf *.tdy
	perltidy -w ${PERL_FILES}

PYTHON_FILES=$(wildcard **/*.py)
install-ruff:
	@if ! command -v ruff ; then pipx install ruff ; fi
python-style-fix: install-ruff
	ruff format ${PYTHON_FILES}
	ruff check ${PYTHON_FILES} --fix
python-style-check: install-ruff
	ruff format --check ${PYTHON_FILES}
	ruff check ${PYTHON_FILES}
python-typecheck:
	@mypy --strict --install-types --non-interactive ${PYTHON_FILES} > /dev/null 2>&1 || true
	mypy --strict --ignore-missing-imports ${PYTHON_FILES}


SH_SCRIPTS   := $(shell grep -r -l --exclude='*~' --exclude='*.tar' --exclude=gradlew --exclude-dir=.git '^\#! \?\(/bin/\|/usr/bin/env \)sh'   | grep -v addrfilter | grep -v cronic-orig | grep -v mail-stackoverflow.sh)
BASH_SCRIPTS := $(shell grep -r -l --exclude='*~' --exclude='*.tar' --exclude=gradlew --exclude-dir=.git '^\#! \?\(/bin/\|/usr/bin/env \)bash' | grep -v addrfilter | grep -v cronic-orig | grep -v mail-stackoverflow.sh)
CHECKBASHISMS := $(shell if command -v checkbashisms > /dev/null ; then \
	  echo "checkbashisms" ; \
	else \
	  wget -q -N https://homes.cs.washington.edu/~mernst/software/checkbashisms && \
	  mv checkbashisms .checkbashisms && \
	  chmod +x ./.checkbashisms && \
	  echo "./.checkbashisms" ; \
	fi)
shell-style-fix:
ifneq ($(SH_SCRIPTS)$(BASH_SCRIPTS),)
	shfmt -w -i 2 -ci -bn -sr ${SH_SCRIPTS} ${BASH_SCRIPTS}
	shellcheck -x -P SCRIPTDIR --format=diff ${SH_SCRIPTS} ${BASH_SCRIPTS} | patch -p1
endif
shell-style-check:
ifneq ($(SH_SCRIPTS)$(BASH_SCRIPTS),)
	shfmt -d -i 2 -ci -bn -sr ${SH_SCRIPTS} ${BASH_SCRIPTS}
	shellcheck -x -P SCRIPTDIR --format=gcc ${SH_SCRIPTS} ${BASH_SCRIPTS}
endif
ifneq ($(SH_SCRIPTS),)
	${CHECKBASHISMS} -l ${SH_SCRIPTS}
endif

showvars:
	@echo "PERL_FILES=${PERL_FILES}"
	@echo "PYTHON_FILES=${PYTHON_FILES}"
	@echo "SH_SCRIPTS=${SH_SCRIPTS}"
	@echo "BASH_SCRIPTS=${BASH_SCRIPTS}"
