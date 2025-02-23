(lang dune 3.8)

(using melange 0.1)

(name melange-for-react-devs)

(generate_opam_files true)

(package
  (name melange-for-react-devs)
  (synopsis "ipl-chat")
  (description "melange-for-react-devs")
  (depends
    melange
    reason-react
  )
)