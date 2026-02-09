add_rules("mode.debug", "mode.release")
--add_requires('ntk', {system = true})
--add_requires('ntk_images', {system = true})

target('jsm')
	set_kind('binary')
	add_files('src/jsm_ui.cpp')
    add_files('FL/*.C')
    add_includedirs('nonlib', 'FL')
	add_syslinks('pthread', 'lo', 'X11', 'cairo')
	add_options('NativeOptimizations')
    --add_files('FL/util/*.C')
    --add_packages('ntk', 'ntk_images')

    add_defines('VERSION=\'2\'')
    add_defines('SYSTEM_PATH=\'/usr/local/share/jsm\'')
    add_defines('DOCUMENT_PATH=\'/usr/local/share/doc\'')
    add_defines('PIXMAP_PATH=\'/usr/local/share/pixmaps\'')

    -- Install icons, docs and instruments
    after_install(function (target)
        import('privilege.sudo')
        if sudo.has() then
            -- Install documentation
            sudo.run('mkdir -p /usr/local/share/doc/jsm')
            sudo.run('cp -r $(projectdir)/doc/. /usr/local/share/doc/jsm')

            -- Install icons
            local sizes = {'16x16', '32x32', '36x36', '48x48', '64x64', '72x72', '96x96', '128x128', '192x192', '256x256', '512x512' }
            for _, size in ipairs(sizes) do
                local src = string.format('$(projectdir)/icons/hicolor/%s/apps/jsm.png', size)
                local dest_dir = string.format('/usr/local/share/icons/hicolor/%s/apps', size)
                sudo.run(string.format('mkdir -p %s', dest_dir))
                sudo.run(string.format('cp -f %s %s', src, dest_dir))
            end

            -- Install pixmap
            sudo.run('mkdir -p /usr/local/share/pixmaps/jsm')
            sudo.run('cp -f $(projectdir)/icons/hicolor/256x256/apps/jsm.png /usr/local/share/pixmaps/jsm/icon-256x256.png')

            -- Install desktop file
            sudo.run('cp $(projectdir)/jsm.desktop.in /usr/local/share/applications/jsm.desktop')
        end
    end)

    -- Remove icons, docs and instruments
    after_uninstall(function (target)
        import('privilege.sudo')
        if sudo.has() then
            -- Remove documentation
            sudo.run('rm -rf /usr/local/share/doc/jsm')

            -- Remove icons
            local sizes = { '16x16', '32x32', '36x36', '48x48', '64x64', '72x72', '96x96', '128x128', '192x192', '256x256', '512x512' }
            for _, size in ipairs(sizes) do
                sudo.run(string.format('rm -f /usr/local/share/icons/hicolor/%s/apps/jsm.png', size))
            end

            -- Remove pixmaps
            sudo.run('rm -rf /usr/local/share/pixmaps/jsm')

            -- Remove dekstop
            sudo.run('rm -rf /usr/local/share/applications/jsm.desktop')
        end
    end)


target('jsmd')
    set_kind('binary')
    add_files('src/jsmd.cpp')
    add_files('nonlib/*.C', 'nonlib/OSC/*.C')
	add_includedirs('nonlib', 'nonlib/OSC')
    add_syslinks('pthread', 'lo')
    add_options('NativeOptimizations')

-- SSE2 Optimisation Switch. TODO: Does xmake disable sse2 by default?
option('NativeOptimizations')
    set_default(true)
    set_showmenu(true)
    add_vectorexts('sse2')

