PY?=python3

BASEDIR=$(CURDIR)
TESTSDIR=$(BASEDIR)/.tests
SCHEMASDIR=$(BASEDIR)/.schemas
PYTHONPATH=$(TESTSDIR)

VERBOSE ?= 0

help:
	@echo 'Makefile for a testing pytube/data                                 '
	@echo '                                                                   '
	@echo 'Usage:                                                             '
	@echo '   make test                   run all tests                       '
	@echo '   make test-schemas           run schema validation tests         '
	@echo '   make test-dir-structure     run direcotry structure tests       '
	@echo '   make test-ids-unique        run "unique IDs" test               '
	@echo '   make test-slugs-unique      run "unique slugs" test             '
	@echo '   make test-render-rest       run ReST rendering test             '
	@echo '   make test-shape             run data shape test                 '
	@echo '                                                                   '
	@echo 'Set the VERBOSE variable to 1 to enable more verbose output.       '
	@echo 'e.g. make VERBOSE=1 test                                           '
	@echo '                                                                   '

install-deps:
	pip install -r $(TESTSDIR)/requirements.txt

test-schemas: install-deps
	$(PY) $(TESTSDIR)/schemas.py -d $(BASEDIR) -s $(SCHEMASDIR) -v $(VERBOSE)

test-dir-structure: install-deps
	$(PY) $(TESTSDIR)/dir_structure.py -d $(BASEDIR)

test-ids-unique: install-deps
	$(PY) $(TESTSDIR)/ids_unique.py -d $(BASEDIR)

test-slugs-unique: install-deps
	$(PY) $(TESTSDIR)/slugs_unique.py -d $(BASEDIR)

test-render-rest: install-deps
	$(PY) $(TESTSDIR)/render_rest.py -d $(BASEDIR)

test-shape: install-deps
	$(PY) $(TESTSDIR)/shape.py -d $(BASEDIR)

test: test-schemas test-dir-structure test-ids-unique test-slugs-unique test-render-rest test-shape

.PHONY: help test test-schemas test-dir-structure test-ids-unique test-slugs-unique test-render-rest test-shape

