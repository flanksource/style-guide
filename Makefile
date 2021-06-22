.PHONY: lint-markdown
lint-markdown: 
	npm install markdownlint-cli@0.27.1
	npx markdownlint '**/*.md' --ignore 'node_modules' --ignore 'ui/node_modules' -c .markdownlint.json

.PHONY: fix-markdown
fix-markdown: 
	npm install markdownlint-cli@0.27.1
	npx markdownlint '**/*.md' --fix --ignore 'node_modules' --ignore 'ui/node_modules' -c .markdownlint.json