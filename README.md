# JSM

JSM is a provisional fork of New Session Manager (NSM), which is in turn a fork of Non Session Manager (also NSM). It's main purpose is to port NSM to BSD platforms.

If the official NSM daemon gains BSD support, JSM will merely be a new (old) UI for it. The desire to behind a new NSM GUI is to allow more FLTK themes and restore NTK as an option, as the Non-XT project does (so using all the Non forks can feel cohesive again). Otherwise if the New Session Manager maintainers do not want BSD support, then JSM will also be a fork of the daemon and will integrate with the existing Non* ecosystem again, using [nonlib-xt](https://github.com/Stazed/nonlib-xt).

Provisionally I have split away forks the bundled tools (jackpatch and NSM Proxy) into a new repo, [nsm-tools](https://github.com/M0JXD/nsm-tools).
The *extras* directory containing the NSM client header and Python implementation have been removed, as the intention here is to make a portable version of NSM that's more integrated with the active Non forks, and not to make client protocol changes. Such to say, JSM does not replace NSM, and those files should be obtained from the official New Session Manager repository.

## TODO

- Add NTK build
- Awaiting response fron NSM maintainers, start FreeBSD port changing signalfd for kqueue or an event library.
- Make JSM UI use it's own "JSM Sessions" directory
- Nice to have: I see no reason why JSM should not have a TUI interface too.
- Update docs

## Build

The build system has been changed to Xmake. The previous Meson system would not reliably detect FLTK, and Xmake is just better in my opinion.

## License

I would prefer this fork be licensed under the GPLv2 like most of the other applications in the Linux Audio ecosystem. Please petition your local New Session Manager developer to revert their upgrade to the GPLv3.
