import os

def juntar_arquivos():
    pasta_raiz = "."
    arquivo_saida = "codigo_completo.txt"

    pastas_ignorar = {"venv", ".git", "__pycache__", "node_modules"}

    extensoes = (
        ".py", ".html", ".js", ".css",
        ".md", ".sh", ".json", ".yml",
        ".yaml", ".txt"
    )

    contador = 0

    with open(arquivo_saida, "w", encoding="utf-8") as saida:

        for pasta_atual, subpastas, arquivos in os.walk(pasta_raiz):

            subpastas[:] = [p for p in subpastas if p not in pastas_ignorar]

            for arquivo in arquivos:

                if not arquivo.endswith(extensoes):
                    continue

                caminho = os.path.join(pasta_atual, arquivo)

                if arquivo == arquivo_saida:
                    continue

                contador += 1

                print("Adicionando:", caminho)

                saida.write("\n\n")
                saida.write("=" * 80 + "\n")
                saida.write(f"ARQUIVO: {caminho}\n")
                saida.write("=" * 80 + "\n\n")

                try:
                    with open(caminho, "r", encoding="utf-8", errors="ignore") as f:
                        saida.write(f.read())
                except Exception as e:
                    saida.write(f"Erro ao ler arquivo: {e}\n")

    print(f"\n✔ {contador} arquivos adicionados em {arquivo_saida}")


if __name__ == "__main__":
    juntar_arquivos()
