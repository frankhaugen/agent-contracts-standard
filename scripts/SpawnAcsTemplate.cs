// Spawn ACS template: copies templates/ from repository root into destination [0].
// Run from repo: dotnet run --project scripts/SpawnAcsTemplate.csproj -- <destination-path>

static string FindRepoRoot()
{
    var dir = new DirectoryInfo(AppContext.BaseDirectory);
    while (dir is not null)
    {
        var templates = Path.Combine(dir.FullName, "templates");
        if (Directory.Exists(templates))
            return dir.FullName;
        dir = dir.Parent;
    }

    throw new InvalidOperationException(
        "Could not locate a 'templates' directory by walking up from the build output. Run from the agent-contracts-standard clone, or pass repo root as second argument.");
}

var argsList = Environment.GetCommandLineArgs().Skip(1).Where(a => a != "--").ToArray();
if (argsList.Length is 0 or > 2)
{
    Console.Error.WriteLine("Usage: dotnet run --project scripts/SpawnAcsTemplate.csproj -- <destination-path> [repo-root]");
    Console.Error.WriteLine("Example: dotnet run --project scripts/SpawnAcsTemplate.csproj -- D:\\work\\my-repo");
    return 1;
}

var destArg = argsList[0];
var repoRoot = argsList.Length >= 2 ? Path.GetFullPath(argsList[1]) : FindRepoRoot();
var source = Path.Combine(repoRoot, "templates");
if (!Directory.Exists(source))
{
    Console.Error.WriteLine($"templates not found: {source}");
    return 1;
}

var destFull = Path.GetFullPath(destArg);
Directory.CreateDirectory(destFull);

foreach (var entry in Directory.GetFileSystemEntries(source))
{
    var name = Path.GetFileName(entry);
    if (string.IsNullOrEmpty(name))
        continue;
    var target = Path.Combine(destFull, name);
    if (Directory.Exists(entry))
    {
        CopyDirRecursive(entry, target);
    }
    else
    {
        File.Copy(entry, target, overwrite: true);
    }
}

Console.WriteLine($"ACS template copied from '{source}' to '{destFull}'.");
return 0;

static void CopyDirRecursive(string srcDir, string dstDir)
{
    Directory.CreateDirectory(dstDir);
    foreach (var file in Directory.GetFiles(srcDir))
    {
        var destFile = Path.Combine(dstDir, Path.GetFileName(file));
        File.Copy(file, destFile, overwrite: true);
    }

    foreach (var sub in Directory.GetDirectories(srcDir))
    {
        var destSub = Path.Combine(dstDir, Path.GetFileName(sub));
        CopyDirRecursive(sub, destSub);
    }
}
