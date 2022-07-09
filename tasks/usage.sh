# tasks/usage.sh
function btask.usage.run() {
    # esta opcao e chamada quando o numero de argumentos nulo
    echo Usage: $(b.get "iprj.config.name") '[tasks] [options]'
    echo
}

# vim: set ts=4 sw=4 tw=78 ft=sh:
