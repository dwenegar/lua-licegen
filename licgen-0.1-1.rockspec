package = "licgen"
version = "0.1-1"
source = {
    url = "https://github.com/dwenegar/lua-licgen.git"
}

description = {
    summary = "Generate an open source licence for your projects.",
    detailed = "Generate an open source licence for your projects.",
    license = "Public Domain"
}
dependencies = {
    "luafilesystem"
}
build = {
    type = "builtin",
    modules = {
        ['licgen.loader'] = 'licgen/loader.lua'
    },
    copy_directories = {
        "templates"
    },
    install = {
        bin = {
            licgen = "bin/licgen.lua"
        }
    }
}
