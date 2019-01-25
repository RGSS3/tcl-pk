package provide tclpk 1.0.0
namespace eval tclpk {
    ::oo::class create container {
        variable c d
        constructor {} {
            set c [dict create]
            set d [dict create]
        }

        method get {name} {
            dict get c $name
        }

        method create {name} {
            if [dict exists $d $name] {
                return [dict get $d $name]
            } else {
                if {![dict exists $d $name]} {
                    return -error "Can't find $name"
                } else {
                    set lambda [dict get $c $name]
                    set obj [apply $lambda [self]]
                    dict set d $name $obj
                    return $obj
                }
            }
        }


        method register {name arg body} {
            dict set c $name [list $arg $body]
            set getter [string cat . $name]
            ::oo::objdefine [self] [list method $getter {} [list [self] create $name]]
            ::oo::objdefine [self] [list export $getter]
            set getter
        }

        method _setDict {args} {
            dict set d {*}$args
        }

        method _unsetDict {args} {
            dict unset d {*}$args
        }

        method _dictSize {args} {
            dict size [dict get $d {*}$args]
        }

        method dict {args} {
            foreach name $args {
                set getter [[self] register $name {c} {dict create}]
                [self] $getter
                ::oo::objdefine [self] [list method add_$name args "
                    foreach {k v} \$args {
                        my _setDict $name \$k \$v
                    }
                "]
                ::oo::objdefine [self] [list method remove_$name args "
                    foreach k \$args {
                        my _unsetDict $name k
                    }
                "]
                ::oo::objdefine [self] [list method len_$name {} "
                    my _dictSize $name
                "]
            }
        }

        
    }


}

