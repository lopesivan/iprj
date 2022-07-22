# tasks/registry.sh
function btask.registry.run() {

	if [ "$1" == '--help' ]; then
		#'<,'>!fmt -w 60   formatador
		cat <<-EOF
			---------------------------------------------------
			Lista catálogo

			    Usage: $(b.get "iprj.config.name") '[options]'

			Exemplo

			    docker pull dev:5000/ubuntu:18.04
		EOF
		return $(b.get "iprj.config.help_message")

	fi

	local catalogo=$(
		curl -qk https://dev:5000/v2/_catalog |
			jq .repositories[] |
			fzf-tmux
	)

	if [[ ! -z $catalogo ]]; then
		local cmd=$(echo \
			curl -k https://dev:5000/v2/${catalogo}/tags/list |
			sed 's|"||g')

		echo $cmd |
			tee >(xclip -i -selection clipboard)
		eval $(xclip -selection clipboard -o) | jq
		eval $(xclip -selection clipboard -o) | jq '.name,.tags[]'
		echo docker pull registry.local:5000/NAME:TAG

	fi

}

# vim: set ts=4 sw=4 tw=78 ft=sh:
