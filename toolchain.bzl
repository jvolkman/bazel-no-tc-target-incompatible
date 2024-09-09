TestInfo = provider(
    doc = "Test provider",
    fields = {},
)

def _test_toolchain_impl(ctx):
    return [
        platform_common.ToolchainInfo(
            testinfo = TestInfo(),
        ),
    ]

test_toolchain = rule(
    implementation = _test_toolchain_impl,
    doc = "test toolchain",
)

def _has_registered_test_toolchain_flag_value_impl(ctx):
    if ctx.toolchains["//:toolchain_type"] != None:
        has_tc = "yes"
    else:
        has_tc = "no"

    return [
        config_common.FeatureFlagInfo(value = has_tc),
    ]

has_registered_test_toolchain_flag_value = rule(
    implementation = _has_registered_test_toolchain_flag_value_impl,
    toolchains = [
        config_common.toolchain_type("//:toolchain_type", mandatory = False),
    ],
)

has_registered_toolchain = select({
    "//:_has_registered_toolchain_setting": [],
    "//conditions:default": ["@platforms//:incompatible"],
})
