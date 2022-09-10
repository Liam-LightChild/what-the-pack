param(
    [switch]$NoBehaviorPack,
    [switch]$NoResourcePack,
    [switch]$NoWorldTemplate,
    [switch]$Individual
)

if ($Individual) {
    if (!$NoBehaviorPack) {
        Compress-Archive .\behavior_pack\* what-behavior.mcpack -Force
    }

    if (!$NoResourcePack) {
        Compress-Archive .\resource_pack\* what-resources.mcpack -Force
    }

    if (!$NoWorldTemplate) {
        Compress-Archive .\world_template\* what-world-template.mctemplate -Force
    }
} else {
    [string[]]$Directories = $null

    if (!$NoBehaviorPack) {
        $Directories = ,".\behavior_pack"
    }

    if (!$NoResourcePack) {
        if($null -eq $Directories) { $Directories = ,".\resource_pack" }
        else { $Directories = $Directories + ".\resource_pack" }
    }

    if (!$NoWorldTemplate) {
        if($null -eq $Directories) { $Directories = ,".\world_template" }
        else { $Directories = $Directories + ".\world_template" }
    }

    Compress-Archive $Directories what.mcaddon -Force
}