_iprj()
{
    local cur prev

    COMPREPLY=()
    cur=`_get_cword`
    prev=${COMP_WORDS[COMP_CWORD-1]}

    _expand || return 0

    case "$prev" in
    new)
        COMPREPLY=( $( compgen -W "$(iprj new ls|sed 's/new_//')" -- "$cur" ) )
        return 0
        ;;
    update)
        COMPREPLY=( $( compgen -W "$(iprj update ls|sed 's/update_//')" -- "$cur" ) )
        return 0
        ;;
    maven)
        COMPREPLY=( $( compgen -W "$(iprj maven ls|sed 's/maven_//')" -- "$cur" ) )
        return 0
        ;;
    -y|--yml)
        _filedir "y?(a)ml";
        # arquivos yaml
        _filedir -d
        # If passed -d, it completes only on directories.
        return 0
        ;;
    -C|--complexion-score)
        COMPREPLY=( $( compgen -W '1 \
                                   2 \
                                   3 \
                                   4 \
                                   5 \
                                   6' -- "$cur" ) )
        return 0
        ;;
    -d|--diffusion)
        COMPREPLY=( $( compgen -W 'auto \
                                   none \
                                   fs \
                                   atkinson \
                                   jajuni \
                                   stucki \
                                   burkes \
                                   a_dither \
                                   x_dither' -- "$cur" ) )
        return 0
        ;;
    -f|--find-largest)
        COMPREPLY=( $( compgen -W 'auto \
                                   norm \
                                   lum' -- "$cur" ) )
        return 0
        ;;
    -s|--select-color)
        COMPREPLY=( $( compgen -W 'auto \
                                   center \
                                   average \
                                   histogram' -- "$cur" ) )
        return 0
        ;;
    -r|--resampling)
        COMPREPLY=( $( compgen -W 'auto \
                                   nearest \
                                   gaussian \
                                   hanning \
                                   hamming \
                                   bilinear \
                                   welsh \
                                   bicubic \
                                   lanczos2 \
                                   lanczos3 \
                                   lanczos4' -- "$cur" ) )
        return 0
        ;;
    -q|--quality)
        COMPREPLY=( $( compgen -W 'auto \
                                   high \
                                   low' -- "$cur" ) )
        return 0
        ;;
    -l|--loop-control)
        COMPREPLY=( $( compgen -W 'auto \
                                   force \
                                   disable' -- "$cur" ) )
        return 0
        ;;
    -t|--palette-type)
        COMPREPLY=( $( compgen -W 'auto \
                                   hls \
                                   rgb' -- "$cur" ) )
        return 0
        ;;
    -b|--builtin-palette)
        COMPREPLY=( $( compgen -W 'xterm16 \
                                   xterm256 \
                                   vt340mono \
                                   vt340color \
                                   gray1 \
                                   gray2 \
                                   gray4 \
                                   gray8 ' -- "$cur" ) )
        return 0
        ;;
    -E|--encode-policy)
        COMPREPLY=( $( compgen -W 'auto \
                                   fast \
                                   size' -- "$cur" ) )
        return 0
        ;;
    -o|--outfile)
        _filedir
        return 0
        ;;
    esac

    case "$cur" in
    -*)
	    COMPREPLY=(
            $( compgen -W "$(iprj  --help | grep '\-' | sed 's/|/\n/g')" -- "$cur" ))
        ;;
    *)
        #_filedir
        COMPREPLY=( $(compgen -W "$(iprj commands)" -- "$cur") )
        ;;
    esac

    return 0
} &&
complete -F _iprj $nospace $filenames iprj
