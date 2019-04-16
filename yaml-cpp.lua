-- scaffold geniefile for yaml-cpp

yaml-cpp_script = path.getabsolute(path.getdirectory(_SCRIPT))
yaml-cpp_root = path.join(yaml-cpp_script, "yaml-cpp")

yaml-cpp_includedirs = {
	path.join(yaml-cpp_script, "config"),
	yaml-cpp_root,
}

yaml-cpp_libdirs = {}
yaml-cpp_links = {}
yaml-cpp_defines = {}

----
return {
	_add_includedirs = function()
		includedirs { yaml-cpp_includedirs }
	end,

	_add_defines = function()
		defines { yaml-cpp_defines }
	end,

	_add_libdirs = function()
		libdirs { yaml-cpp_libdirs }
	end,

	_add_external_links = function()
		links { yaml-cpp_links }
	end,

	_add_self_links = function()
		links { "yaml-cpp" }
	end,

	_create_projects = function()

project "yaml-cpp"
	kind "StaticLib"
	language "C++"
	flags {}

	includedirs {
		yaml-cpp_includedirs,
	}

	defines {}

	files {
		path.join(yaml-cpp_script, "config", "**.h"),
		path.join(yaml-cpp_root, "**.h"),
		path.join(yaml-cpp_root, "**.cpp"),
	}

end, -- _create_projects()
}

---
