build:
	python3 generar_modelos.py > modelo.mod
run:
	glpsol -m modelo.mod -o sol
informe: informe.md
	pandoc $^ -o $@.pdf
