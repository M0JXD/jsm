# JSM

JSM is a fork of New Session Manager (NSM), which is in turn a fork of Non Session Manager (also NSM). The main goals are to:

- Integrate with the existing Non* ecosystem again, using [nonlib-xt](https://github.com/Stazed/nonlib-xt) and [non-FL](https://github.com/Stazed/non-FL).
- Restore NTK as a GUI option.
- Bring more options to the FLTK version in alignment with the other Non forks.
- Bring support to new platforms, starting with FreeBSD.

I have split away forks the bundled tools (jackpatch and NSM Proxy) into a new repo, [nsm-tools](https://github.com/M0JXD/nsm-tools).
The *extras* directory containing the NSM client header and Python implementation have been removed, as the intention here is to make a portable version of NSM that's more integrated with the active Non forks, and not to make client protocol changes. Such to say, JSM does not replace NSM, and those files should be obtained from the official New Session Manager repository.

## TODO

- Revert changes to use XDG directory, as JSM and it's daemon are intended as an end user implementation with accessible home folder.
- Get UI version building
- Add NTK build
- Redo docs
- Start FreeBSD port changing signalfd for kqueue
- Nice to have: I see no reason why JSM should not have a TUI interface too.

## Build

The build system has been changed to Xmake. The previous Meson system would not reliably detect FLTK.

## License

I would prefer this fork be licensed under the GPLv2 like most of the other applications in the Linux Audio ecosystem. Please petition your local New Session Manager developer to revert their upgrade to the GPLv3.
