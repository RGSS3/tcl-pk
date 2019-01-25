package provide tclpk 1.0.0

namespace eval tclpk {
    
    proc def {name arg body} {
        uplevel [list proc $name $arg $body]
        set name
    }

    proc around {name arg body} {
        set newname  [string cat $name "_\$o"]
        set procname [string cat $name "_\$v"]
        uplevel [list rename $name $newname]
        uplevel [list proc $procname [linsert $args 0 origin] $body]
        uplevel [list proc $name $arg [list $procname $newname {*}$arg]]
    }

    namespace export *
}



