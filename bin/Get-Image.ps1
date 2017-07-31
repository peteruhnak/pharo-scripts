param (
    [String]$Version
)

$LatestBaseline = '70'


function Image-Url($Baseline, $Version) {
    return "http://files.pharo.org/image/$Baseline/$Version.zip"
}


function Download-Image($Baseline, $Version)
{
    $Url = Image-Url -Baseline $Baseline -Version $Version
    $File = ".\$Version.zip"
    Invoke-WebRequest -Uri $Url -OutFile $File
    Expand-Archive $File -DestinationPath ".\"
    Remove-Item $File
}


function Download-Image-Version($VersionDesc)
{
    $Version = 'latest'
    If ($VersionDesc.Length -eq 0) {
        $Baseline = $LatestBaseline
    } ElseIf ($VersionDesc.Length -eq 1) {
        $Baseline = "${VersionDesc}0"
    } ElseIf ($VersionDesc.Length -eq 2) {
        $Baseline = $VersionDesc
    } Else {
        $Baseline = $VersionDesc.Substring(0,2)
        $Version = $VersionDesc
    }

    Download-Image -Baseline $Baseline -Version $Version
}


Download-Image-Version $Version