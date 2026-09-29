Write-Host "=========================================" -ForegroundColor Cyan
Write-Host " Enviando os 4 portfólios para o GitHub" -ForegroundColor Cyan
Write-Host " Conta: https://github.com/dornellasz93" -ForegroundColor Cyan
Write-Host "=========================================" -ForegroundColor Cyan

$repos = @(
    @{ Name = "Pedro Henrique"; Path = "pedro"; Url = "https://github.com/dornellasz93/portifolio-pedro.git" },
    @{ Name = "Kauê Loreno"; Path = "kaue"; Url = "https://github.com/dornellasz93/portifolio-kaue.git" },
    @{ Name = "João Marcelo"; Path = "joao"; Url = "https://github.com/dornellasz93/portifolio-joao.git" },
    @{ Name = "Thiago Pires"; Path = "thiago"; Url = "https://github.com/dornellasz93/portifolio-thiago.git" }
)

foreach ($r in $repos) {
    Write-Host "`n>>> Enviando portfólio de $($r.Name) ($($r.Path))..." -ForegroundColor Yellow
    git -C $r.Path push -u origin main
    if ($LASTEXITCODE -eq 0) {
        Write-Host "✓ $($r.Name) enviado com sucesso para $($r.Url)!" -ForegroundColor Green
    } else {
        Write-Host "✗ Falha ao enviar $($r.Name). Certifique-se de que o repositório foi criado em: $($r.Url)" -ForegroundColor Red
    }
}

Write-Host "`n=========================================" -ForegroundColor Cyan
Write-Host " Concluído!" -ForegroundColor Cyan
Write-Host "=========================================" -ForegroundColor Cyan
