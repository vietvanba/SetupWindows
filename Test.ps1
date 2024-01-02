$pgsqlPath = Join-Path $env:ProgramFiles 'PostgreSQL\14\bin'
$psqlCommand = Join-Path $pgsqlPath 'psql.exe'
            
$pwCommand = "ALTER USER postgres PASSWORD '1';"
& $psqlCommand -U postgres -c $pwCommand