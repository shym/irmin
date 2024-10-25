; This file is generated by ortac dune qcheck-stm
; It contains the rules for generating and running QCheck-STM tests for lru_spec.mli

(rule
 (alias runtest)
 (mode promote)
 (package irmin-test)
 (deps
  (package ortac-qcheck-stm))
 (targets lru_spec_tests.ml)
 (action
  (setenv
   ORTAC_ONLY_PLUGIN
   qcheck-stm
   (with-stdout-to
    %{targets}
    (run
     ortac
     qcheck-stm
     %{dep:lru_spec.mli}
     %{dep:lru_spec_config.ml}
     --quiet)))))

(test
 (name lru_spec_tests)
 (modules lru_spec_tests)
 (libraries
  lru_spec
  qcheck-stm.stm
  qcheck-stm.sequential
  qcheck-multicoretests-util
  ortac-runtime-qcheck-stm)
 (package irmin-test)
 (action
  (run
   %{test}
   --verbose)))