# Tcl package index file, version 1.1
# This file is generated by the "pkg_mkIndex" command
# and sourced either when an application starts up or
# by a "package unknown" script.  It invokes the
# "package ifneeded" command to set up package-related
# information so that packages will be loaded automatically
# in response to "package require" commands.  When this
# script is sourced, the variable $dir must contain the
# full path name of this file's directory.

package ifneeded tclpk 1.0.0 [list source [file join $dir 0proc.tcl]]\n[list source [file join $dir dsl.tcl]]\n[list source [file join $dir ioc.tcl]]\n[list source [file join $dir ns.tcl]]\n[list source [file join $dir tclpk.tcl]]\n[list source [file join $dir util.tcl]]
