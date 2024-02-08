#> xylo_iris:setup/storage
#
# Sets up storage for xylo_iris
#
# @within xylo_iris:setup/load

data merge storage xylo_iris:data {is_setup: 1b}

# Set default settings
data merge storage xylo_iris:settings {\
    TargetEntities: false,\
    MaxRecursionDepth: 16,\
    Blacklist: "#xylo_iris:shape_groups/air"\
}
