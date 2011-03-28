/*
 * Jakefile
 *
 * Copyright (C) 2011 Gerrit Riessen
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 3.0 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 * 
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
 */

var ENV = require("system").env,
    FILE = require("file"),
	OS = require("os"),
	JAKE = require("jake"),
    task = JAKE.task,
    CLEAN = require("jake/clean").CLEAN,
    FileList = JAKE.FileList,
    framework = require("cappuccino/jake").framework,
    configuration = ENV["CONFIG"] || ENV["CONFIGURATION"] || ENV["c"] || "Release";

framework ("GRKit", function(task)
{
    task.setBuildIntermediatesPath(FILE.join("Build", "GRKit.build", configuration));
    task.setBuildPath(FILE.join("Build", configuration));

    task.setProductName("GRKit");
    task.setIdentifier("es.2monki.GRKit");
    task.setVersion("1.0");
    task.setAuthor("Gerrit Riessen");
    task.setEmail("gerrit.riessen @ gmail.com");
    task.setSummary("GRKit");
    task.setSources(new FileList("*.j", "GRKit/*.j"));
    task.setResources(new FileList("Resources/**/**"));
    task.setInfoPlistPath("Info.plist");

    if (configuration === "Debug")
        task.setCompilerFlags("-DDEBUG -g");
    else
        task.setCompilerFlags("-O");
});

task("build", ["GRKit"]);

task("debug", function()
{
    ENV["CONFIG"] = "Debug";
    JAKE.subjake(["."], "build", ENV);
});

task("release", function()
{
    ENV["CONFIG"] = "Release";
    JAKE.subjake(["."], "build", ENV);
});

task ("documentation", function()
{
   OS.system("doxygen GRKit.doxygen");
});

task("test", function()
{
    var tests = new FileList('Test/*Test.j');
    var cmd = ["ojtest"].concat(tests.items());
    var cmdString = cmd.map(OS.enquote).join(" ");

    var code = OS.system(cmdString);
    if (code !== 0)
        OS.exit(code);
});

task ("default", ["release"]);
task ("docs", ["documentation"]);
task ("all", ["release", "debug", "documentation"]);
