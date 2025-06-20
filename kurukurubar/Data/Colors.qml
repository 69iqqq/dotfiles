
pragma Singleton
import Quickshell
import QtQuick

Singleton {
  readonly property color background: "#1a110f"
  readonly property color error: "#ffb4ab"
  readonly property color error_container: "#93000a"
  readonly property color inverse_on_surface: "#392e2c"
  readonly property color inverse_primary: "#904b3c"
  readonly property color inverse_surface: "#f1dfdb"
  readonly property color on_background: "#f1dfdb"
  readonly property color on_error: "#690005"
  readonly property color on_error_container: "#ffdad6"
  readonly property color on_primary: "#561f13"
  readonly property color on_primary_container: "#ffdad3"
  readonly property color on_primary_fixed: "#3a0a03"
  readonly property color on_primary_fixed_variant: "#733426"
  readonly property color on_secondary: "#442a24"
  readonly property color on_secondary_container: "#ffdad3"
  readonly property color on_secondary_fixed: "#2c1510"
  readonly property color on_secondary_fixed_variant: "#5d3f39"
  readonly property color on_surface: "#f1dfdb"
  readonly property color on_surface_variant: "#d8c2bd"
  readonly property color on_tertiary: "#3c2f04"
  readonly property color on_tertiary_container: "#f8e0a6"
  readonly property color on_tertiary_fixed: "#241a00"
  readonly property color on_tertiary_fixed_variant: "#544519"
  readonly property color outline: "#a08c88"
  readonly property color outline_variant: "#534340"
  readonly property color primary: "#ffb4a4"
  readonly property color primary_container: "#733426"
  readonly property color primary_fixed: "#ffdad3"
  readonly property color primary_fixed_dim: "#ffb4a4"
  readonly property color scrim: "#000000"
  readonly property color secondary: "#e7bdb4"
  readonly property color secondary_container: "#5d3f39"
  readonly property color secondary_fixed: "#ffdad3"
  readonly property color secondary_fixed_dim: "#e7bdb4"
  readonly property color shadow: "#000000"
  readonly property color surface: "#1a110f"
  readonly property color surface_bright: "#423734"
  readonly property color surface_container: "#271d1b"
  readonly property color surface_container_high: "#322825"
  readonly property color surface_container_highest: "#3d3230"
  readonly property color surface_container_low: "#231917"
  readonly property color surface_container_lowest: "#140c0a"
  readonly property color surface_dim: "#1a110f"
  readonly property color surface_tint: "#ffb4a4"

  readonly property color surface_variant: "#534340"
  readonly property color tertiary: "#dbc48c"
  readonly property color tertiary_container: "#544519"
  readonly property color tertiary_fixed: "#f8e0a6"
  readonly property color tertiary_fixed_dim: "#dbc48c"

  function withAlpha(color: color, alpha: real): color {
    return Qt.rgba(color.r, color.g, color.b, alpha)
  }
}
