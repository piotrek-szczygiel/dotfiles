function run_mote
    pushd "$HOME/Developer/mote"
    set -l result 0
    set -l newer_source (find src -type f \( -name '*.odin' -o -name '*.slang' \) -newer out/mote -print -quit 2>/dev/null)
    if not test -x out/mote; or test -n "$newer_source"
        ./build.bat release
        set result $status
    end
    if test $result -eq 0
        ./out/mote
        set result $status
    end
    popd
    return $result
end
