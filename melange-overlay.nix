pkgs: prev: prev.melange.overrideAttrs (oa: {
    nativeBuildInputs = oa.nativeBuildInputs ++ (with pkgs; [ makeWrapper git ]);
    postInstall = ''
        wrapProgram "$out/bin/melc" \
            --set MELANGELIB "$OCAMLFIND_DESTDIR/melange/melange:$OCAMLFIND_DESTDIR/melange/js/melange" \
            --set BELTLIB "$OCAMLFIND_DESTDIR/melange/belt:$OCAMLFIND_DESTDIR/melange/belt/melange"
        '';
})