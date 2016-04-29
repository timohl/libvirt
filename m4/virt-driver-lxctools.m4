AC_DEFUN([LIBVIRT_DRIVER_ARG_LXCTOOLS], [
  LIBVIRT_ARG_WITH_FEATURE([LXCTOOLS], [LXCtools], [check])
])

AC_DEFUN([LIBVIRT_DRIVER_CHECK_LXCTOOLS], [
  if test "$with_lxctools" = "check"; then
    with_lxctools=$with_linux
  fi

  if test "$with_lxctools" = "yes" && test "$with_linux" = "no"; then
    AC_MSG_ERROR([The LXCtools driver can be enabled on Linux only.])
  fi

  if test "$with_lxctools" = "yes"; then
    AC_DEFINE_UNQUOTED([WITH_LXCTOOLS], 1, [whether LXCtools driver is enabled])
  fi

  AM_CONDITIONAL([WITH_LXCTOOLS], [test "$with_lxctools" = "yes"])
])

AC_DEFUN([LIBVIRT_DRIVER_RESULT_LXCTOOLS], [
  LIBVIRT_RESULT([LXCtools], [$with_lxctools])
])
