build:
	python3 generar_modelos.py > modelo.mod
run:
	glpsol -m modelo.mod -o sol
6.8.pdf: 6.8.md
	pandoc $^ -o $@

informe.pdf: informe.md
	pandoc $^ -o $@

informe: informe.pdf 6.8.pdf

