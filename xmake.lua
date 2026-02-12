add_rules("mode.debug", "mode.release")
add_requires('fltk', 'fltk_images', {system = true})
add_requires('ntk', 'ntk_images', {system = true, optional = true})

target('jsm')
	set_kind('binary')
	add_files('src/jsm_ui.cpp')
	add_includedirs('FL', 'nonlib', 'nonlib/OSC')
	add_files('FL/Fl_Scalepack.C')
	add_files('nonlib/*.C', 'nonlib/OSC/*.C')
	add_syslinks('pthread', 'lo', 'X11', 'cairo')
	add_options('NativeOptimizations', 'NtkBuild')
	if has_config("NtkBuild") then
		add_packages('ntk', 'ntk_images')
	else
		add_packages('fltk', 'fltk_images')
	end

target('jsmd')
    set_kind('binary')
    add_files('src/jsmd.cpp')
    add_files('nonlib/Thread.C', 'nonlib/debug.C', 'nonlib/OSC/Endpoint.C')
	add_includedirs('nonlib', 'nonlib/OSC')
    add_syslinks('pthread', 'lo')
    add_options('NativeOptimizations')

option('NtkBuild')
	set_default(false)
	set_showmenu(true)

-- SSE2 Optimisation Switch. TODO: Does xmake disable sse2 by default?
option('NativeOptimizations')
    set_default(true)
    set_showmenu(true)
    add_vectorexts('sse2')
