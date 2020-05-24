Set-Location D:\scoop\cache;
$name1 = $null;
$version1 = $null;
Get-ChildItem -Name | Sort-Object -Descending | ForEach-Object {
  $arr = $_ -split "#";
  $name2 = $arr[0];
  $version2 = $arr[1];
  if ($name2 -ne $name1) {
    $name1 = $name2;
    $version1 = $version2;
    return;
  }
  if ($version1 -eq $version2) {
    return;
  }
  if ($version1 -gt $version2) {
    Remove-Item $_;
  }
}
