param(
    [ValidateSet('Behavior','Resources','WorldTemplate')]
    [string[]]$Build = ('Behavior','Resources','WorldTemplate'),
    [switch]$Individual
)

if ($Individual) {
    for ($i = 0; $i -lt $Build.Count; $i++) {
        $item = $Build[$i]
        Write-Progress "Building pack" $item 1 -PercentComplete (([float]$i/[float]$Build.Count)*100.0)
        switch ($item) {
            "Behavior" { Compress-Archive .\behavior_pack\* what-behavior.mcpack -Force }
            "Resources" { Compress-Archive .\resource_pack\* what-resources.mcpack -Force }
            "WorldTemplate" { Compress-Archive .\world_template\* what-world-template.mctemplate -Force }
            Default {}
        }
    }
} else {
    Write-Progress "Building pack" "Initializing" 1 -PercentComplete 0

    if(Test-Path _build) {
        Remove-Item _build -Recurse
    }

    $null = New-Item _build -ItemType Directory

    for ($i = 0; $i -lt $Build.Count; $i++) {
        $item = $Build[$i]
        Write-Progress "Building pack" $item 1 -PercentComplete (([float]$i/[float]$Build.Count)*100.0)
        switch ($item) {
            "Behavior" { Copy-Item .\behavior_pack _build\$item -Recurse }
            "Resources" { Copy-Item .\resource_pack _build\$item -Recurse }
            "WorldTemplate" { Copy-Item .\world_template _build\$item -Recurse }
            Default {}
        }
    }

    Write-Progress "Building pack" "Finishing up" 1 -PercentComplete 100
    Compress-Archive _build\* .\what.mcaddon -Force -CompressionLevel Optimal
    Remove-Item _build -Recurse
}
