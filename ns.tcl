package provide tclpk 1.0.0

namespace eval tclpk {
    def init_pk {args} {
        if {[llength $args] == 0} {
            set ns [uplevel {namespace current}]
        } else {
            set ns [lindex $args 0]
        }
        namespace eval $ns {
            namespace eval pk {
                set container [::tclpk::container new]
                $container dict context
                $container dict resource
            }

            proc @context {a b} {
                upvar [namespace current]::pk::container container
                $container add_context $a $b
            }
            
        }
    }
}