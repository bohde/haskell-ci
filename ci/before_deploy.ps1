function New-TemporaryDirectory {
    $parent = [System.IO.Path]::GetTempPath()
    [string] $name = [System.Guid]::NewGuid()
    New-Item -ItemType Directory -Path (Join-Path $parent $name)
}

function Main {
    $td = New-TemporaryDirectory
    $out_dir = Join-Path $PWD.Path "build"
    New-Item -Path $out_dir -Type directory

    # build a release version
    $release_dir = Join-Path $td "release"
    New-Item -Path $release_dir -Type directory
    stack build --local-bin-path="$release_dir" --ghc-options="-O2" --copy-bins

    pushd $release_dir
    7z a "$out_dir\$($Env:JOB_NAME)-$($Env:TRAVIS_TAG)-$($Env:TARGET)-release.tar.gz" *
    popd

    rm $td -r -fo
}

Main